Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 949291AEC3F
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 13:54:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2086D86B28;
	Sat, 18 Apr 2020 11:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crg2BUEZDVEI; Sat, 18 Apr 2020 11:54:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7362A8770A;
	Sat, 18 Apr 2020 11:54:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D002C0172;
	Sat, 18 Apr 2020 11:54:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51D78C0172
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 11:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B1C388222
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 11:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0uWhyst8h9JP for <iommu@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 11:54:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0E80B88216
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 11:54:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F25AB342; Sat, 18 Apr 2020 13:54:02 +0200 (CEST)
Date: Sat, 18 Apr 2020 13:54:00 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
Message-ID: <20200418115400.GF21900@8bytes.org>
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
 <20200402064552.GG663905@yoga>
 <7a565c74-f223-83da-cf32-0474be6c9460@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a565c74-f223-83da-cf32-0474be6c9460@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, agross@kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Apr 16, 2020 at 02:42:23PM +0800, Tang Bin wrote:
> =A0=A0=A0=A0=A0=A0=A0 The function qcom_iommu_device_probe() does not per=
form sufficient
> error checking after executing devm_ioremap_resource(), which can result =
in
> crashes if a critical error path is encountered.
> =

> Fixes: 0ae349a0("iommu/qcom: Add qcom_iommu")

Yes, that sounds better. Please use it for the commit message and also
add the Fixes line and resubmit the fix to me.
Please make the fixes line:

	Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")

So that the commit-id is 12 characters long and a space between it and
the subject.

Thanks,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
