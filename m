Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6D156CD74
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F93829DC;
	Sun, 10 Jul 2022 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F93829DC
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KWVqfoRQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqQy7vHF36ui; Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82F158140D;
	Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82F158140D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A9C3C0070;
	Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C56E6C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91E7E40C93
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91E7E40C93
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=KWVqfoRQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfSm8zDPrxDt for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 10:33:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAC3A40328
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAC3A40328
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:33:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D34C8B825BC;
 Fri,  8 Jul 2022 10:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC54C341C0;
 Fri,  8 Jul 2022 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657276406;
 bh=/+DcsYT34C0mFnuO4YTEFLX8753VES4tr0IjtszpEJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KWVqfoRQu2fJsC+Z2vRfeEdzizbw9iBK5JqQzJ0Re3nEWORyYlqggTUfD8VTkjpqs
 LF7nz/IjqfoVCLryWNPfi9F/VHt+b7AkKBw2WnTlP1HN1jpVh4Ct0KS6R/tlPiZPZS
 Xy81ZtAxrYhMV48hUXuyhnf1JjDdWOQT8mDCR72d6tIkV1Fq5TrmDO7TNzFywj5eqU
 dfAovZgelJWNDuQsX0uK7591gsrgRkW9F33Dph0Tj/0LasBvHtDjUKnI2+EBeUIgEX
 vgCoGia3+5Ma+j/8z7pue9pc7pLb1ocK79MOftmIaTaSNg28DQNJTn+WzQchwjKuMb
 eQwLFknRSaHPw==
Date: Fri, 8 Jul 2022 11:33:21 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/4] iommu/arm-smmu-v3: cleanup
 arm_smmu_dev_{enable,disable}_feature
Message-ID: <20220708103320.GB5744@willie-the-truck>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220708080616.238833-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Jul 08, 2022 at 10:06:16AM +0200, Christoph Hellwig wrote:
> Fold the arm_smmu_dev_has_feature arm_smmu_dev_feature_enabled into
> the main methods.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 55 ++++++---------------
>  1 file changed, 14 insertions(+), 41 deletions(-)

Thanks for the cleanup:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
