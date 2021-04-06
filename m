Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A37354F74
	for <lists.iommu@lfdr.de>; Tue,  6 Apr 2021 11:08:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 391E860A9D;
	Tue,  6 Apr 2021 09:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qn9uEhirfUaW; Tue,  6 Apr 2021 09:08:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477E860A92;
	Tue,  6 Apr 2021 09:08:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25E6DC0012;
	Tue,  6 Apr 2021 09:08:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D933C000A
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 09:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0E07849B8
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 09:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ue5-PCp2sVKp for <iommu@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 09:08:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E643A849AD
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 09:08:23 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 27AE33A4; Tue,  6 Apr 2021 11:08:20 +0200 (CEST)
Date: Tue, 6 Apr 2021 11:08:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "chenxiang (M)" <chenxiang66@hisilicon.com>
Subject: Re: [PATCH] iommu: Add device name to iommu map/unmap trace events
Message-ID: <YGwlAqQVSV6k5z9j@8bytes.org>
References: <20210209123620.19993-1-saiprakash.ranjan@codeaurora.org>
 <20210212105039.GG7302@8bytes.org>
 <626fbcb8-b84f-1522-4ec3-9c7c1f5f7a93@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <626fbcb8-b84f-1522-4ec3-9c7c1f5f7a93@hisilicon.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, Apr 06, 2021 at 02:56:53PM +0800, chenxiang (M) wrote:
> Is it possible to use group id to identify different domains?

No, the best is to do this during post-processing of your traces by also
keeping tack of domain-device attachments/detachments.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
