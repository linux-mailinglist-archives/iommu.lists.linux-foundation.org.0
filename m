Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 23457180323
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 17:23:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A3D1C885CC;
	Tue, 10 Mar 2020 16:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-AX8Ea8hDtX; Tue, 10 Mar 2020 16:23:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A1B9885D4;
	Tue, 10 Mar 2020 16:23:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 101AAC1D8E;
	Tue, 10 Mar 2020 16:23:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9FB9C0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 16:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A8D01885D4
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 16:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9ZX6sgeqUYK for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 16:23:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 53CAE885CC
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 16:23:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BF8F2396; Tue, 10 Mar 2020 17:23:21 +0100 (CET)
Date: Tue, 10 Mar 2020 17:23:20 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Message-ID: <20200310162320.GL3794@8bytes.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200310112332.GG3794@8bytes.org>
 <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-kernel-owner@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, agross@kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Mar 10, 2020 at 07:30:50PM +0530, Sibi Sankar wrote:
> The accesses are initiated by the firmware
> and they access modem reserved regions.
> However as explained in ^^ any accesses
> outside the region will result in a violation
> and is controlled through XPUs (protection units).

Okay, this sounds like a case for arm_smmu_get_resv_region(). It should
return an entry for the reserved memory region the firmware needs to
access, so that generic iommu can setup this mapping.

Note that it should return that entry only for your device, not for all
devices. Maybe there is a property in DT or IORT you can set to
transport this information into the arm-smmu driver.

This is pretty similar to RMRR mapping on the Intel VT-d IOMMU or
Unity-mapped ranges in the AMD-Vi IOMMU.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
