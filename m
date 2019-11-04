Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148BEE83B
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 20:22:38 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A840F14;
	Mon,  4 Nov 2019 19:22:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 91A83F02
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 19:22:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4F7B667F
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 19:22:33 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4D90F2084D;
	Mon,  4 Nov 2019 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572895353;
	bh=MhG1SjLYJ/MiCKm1KPNAmPokTvBcbqXpuiAnoMPPBg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc7u55gEFoctioL006Je3W8RgfHRUpFfA9UoJApZvIElhrrOUsSsjCNy/gH5aQkpm
	9yNVmC9s2tVzfw0qUFjsGxrRENo3JRZpY3EynkP4lDpT83SvzkGyNwfhPT3Lz2T1b/
	fUyWki51LJYGZb8NIBDxQOQaYOK3XIQ6KGeClhv0=
Date: Mon, 4 Nov 2019 19:22:29 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 00/10] iommu/io-pgtable: Cleanup and prep for split
	tables
Message-ID: <20191104192228.GL24909@willie-the-truck>
References: <cover.1572024119.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572024119.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Robin,

On Fri, Oct 25, 2019 at 07:08:29PM +0100, Robin Murphy wrote:
> Since the flawed first attempt, I've reworked things with an abstracted
> TCR and an explicit TTBR1 quirk. I originally envisaged the need to pass
> the quirk all the way down to the TLBI calls, hence getting diverted
> into trying to make the parameter passing less cluttered in general, but
> in the end it turned out fairly neat to just fix the indexing such that
> we can always just pass around the original unmodified IOVA. Most of the
> new patches come from staring at that indexing code for long enough to
> see the subtle inefficiencies that were worth ironing out, plus a bit of
> random cleanup which doesn't feel worth posting separately.
> 
> Note that these patches depend on the fixes already queued in -rc4,
> otherwise there will be conflicts in arm_mali_lpae_alloc_pgtable().
> 
> Robin.
> 
> 
> Robin Murphy (10):
>   iommu/io-pgtable: Make selftest gubbins consistently __init
>   iommu/io-pgtable-arm: Rationalise size check
>   iommu/io-pgtable-arm: Simplify bounds checks
>   iommu/io-pgtable-arm: Simplify start level lookup
>   iommu/io-pgtable-arm: Simplify PGD size handling
>   iommu/io-pgtable-arm: Simplify level indexing
>   iommu/io-pgtable-arm: Rationalise MAIR handling
>   iommu/io-pgtable-arm: Rationalise TTBRn handling
>   iommu/io-pgtable-arm: Rationalise TCR handling
>   iommu/io-pgtable-arm: Prepare for TTBR1 usage

Overall, this looks really good to me. There's a bit more work to do
(see my comments) and I'd like Jordan to have a look as well, but on the
whole it's a big improvement. Thanks.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
