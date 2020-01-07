Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6460A132841
	for <lists.iommu@lfdr.de>; Tue,  7 Jan 2020 15:00:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 110ED87590;
	Tue,  7 Jan 2020 14:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LduBnMRyCTyu; Tue,  7 Jan 2020 14:00:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F2448757D;
	Tue,  7 Jan 2020 14:00:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E886C1D89;
	Tue,  7 Jan 2020 14:00:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11C0AC0881
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 14:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F0DD12037B
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 14:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAVYk2I2M1Uc for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 14:00:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from onstation.org (onstation.org [52.200.56.107])
 by silver.osuosl.org (Postfix) with ESMTPS id B191D20366
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 14:00:15 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 640D53EE6F;
 Tue,  7 Jan 2020 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1578405614;
 bh=F6/bC3WaEdJIW6MX3Lz//wft6IJlpoSxsTV7q3G+ET0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OwKjuKYc5PBpQN6DascPHMtS70Wop9JG59kZqpgakYCOjrEbYgMMrxTUlcKPbz0Fm
 hTn4Idz97xS9Yb5Q/3v/HskYI0L4VttgS6RrDIxSVXNCeoCiWHDYMr+EYD1xR/+x0d
 k4qZI6kJ6yZguJHqmedjvPx9S76EAU6roaqNetnc=
Date: Tue, 7 Jan 2020 09:00:14 -0500
From: Brian Masney <masneyb@onstation.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/qcom: fix NULL pointer dereference during probe
 deferral
Message-ID: <20200107140013.GA9084@onstation.org>
References: <20200101033949.755-1-masneyb@onstation.org>
 <20200107132530.GC30750@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107132530.GC30750@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
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

On Tue, Jan 07, 2020 at 02:25:30PM +0100, Joerg Roedel wrote:
> On Tue, Dec 31, 2019 at 10:39:49PM -0500, Brian Masney wrote:
> >  drivers/iommu/qcom_iommu.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> Shortened commit-message a bit and applied for v5.5, thanks.

You might want to hold off on applying this since it looks like Robin
Murphy has a better fix.

https://lore.kernel.org/lkml/fc055443-8716-4a0e-b4d5-311517d71ea0@arm.com/

Brian

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
