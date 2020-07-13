Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E0219A0A
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 09:33:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 97ED920003;
	Thu,  9 Jul 2020 07:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNQFgRvOj6+0; Thu,  9 Jul 2020 07:33:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5990A2631D;
	Thu,  9 Jul 2020 07:33:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE99C016F;
	Thu,  9 Jul 2020 07:33:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC5DC016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 07:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0C5D08772E
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 07:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kea1q2-LureG for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 07:33:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A081B85462
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 07:33:39 +0000 (UTC)
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43E6520767;
 Thu,  9 Jul 2020 07:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594280019;
 bh=egKqkdwX9z5kdRrXLcad3F+Q12AeoGgHsWBcKCW0Cbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnUpnt8QvxDxM750v0L6hAcTKPWBSNG9X2ixsGlzQPDmWQr+LI9uw4Up43fNMGfXe
 ktx1qN1AeFuemE2NqUtwNQ9sw1VFX/zyq4kjOGEYtoQ789blkG6kDhW9Bqzn1O6cHk
 O6NoSnxjJT1tVbhzxZaukzFy1CRHSAd2LqQaXJ+U=
Date: Thu, 9 Jul 2020 13:03:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/5] iommu/arm-smmu: Support maintaining bootloader
 mappings
Message-ID: <20200709073330.GI34333@vkoul-mobl>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On 08-07-20, 22:01, Bjorn Andersson wrote:
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
> 
> The first patch is an implementation of Robin's suggestion that we should just
> mark the relevant stream mappings as BYPASS. Relying on something else to set
> up the stream mappings wanted - e.g. by reading it back in platform specific
> implementation code.
> 
> The series then tackles the problem seen in most versions of Qualcomm firmware,
> that the hypervisor intercepts BYPASS writes and turn them into FAULTs. It does
> this by allocating context banks for identity domains as well, with translation
> disabled.
> 
> Lastly it amends the stream mapping initialization code to allocate a specific
> identity domain that is used for any mappings inherited from the bootloader, if
> above Qualcomm quirk is required.
> 
> 
> The series has been tested and shown to allow booting SDM845, SDM850, SM8150,
> SM8250 with boot splash screen setup by the bootloader. Specifically it also
> allows the Lenovo Yoga C630 to boot with SMMU and efifb enabled.

This resolves issue on RB3 for me so:

Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
