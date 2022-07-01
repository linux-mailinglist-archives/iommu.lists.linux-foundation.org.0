Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A65635A7
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 16:34:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9740B84738;
	Fri,  1 Jul 2022 14:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9740B84738
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JlTpod6k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9EoxkNEjGmI; Fri,  1 Jul 2022 14:34:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8799B84737;
	Fri,  1 Jul 2022 14:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8799B84737
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4524DC0039;
	Fri,  1 Jul 2022 14:34:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2696C002D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 14:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A7284118A
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 14:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7284118A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=JlTpod6k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUzyJpbe7Jg0 for <iommu@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 14:34:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 595D641188
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 595D641188
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 14:34:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D63962163;
 Fri,  1 Jul 2022 14:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF03C3411E;
 Fri,  1 Jul 2022 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656686047;
 bh=Fh2Yx93xB3C+S/wXYC4C1fagIRcAr8t3LoCK9meJw6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JlTpod6kmJ8Vu+1s2M+gHRiphuzguWZM2ld9fH1qN7NS79nWrdmbv+BUjm6//ODgJ
 LCPmIY9CnRUFe85yAL7RzvXogOD4sxyvoXTFJZkN3az/aTX0nelgkmmEXrG1O00bzD
 UcXu4alq2933ycz+RuPskq5jjKS8FS2wbCKi94NOPjDNRY6lmHObra2LjYFtFDs8md
 lXhQo8hrv7e2ipOQzBwQibtaUIA+pZoKKX7EN7sc6BEdn2t3goh+FmJeAltt/D1J94
 ccC4by786WslgGhWcZLrjLxzTiteIWQCdPuseEhfupAgxheRXluKb6m2aBlvka5IhG
 p+d/D/j76b/sA==
Date: Fri, 1 Jul 2022 15:34:02 +0100
From: Will Deacon <will@kernel.org>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix undefined behavior in GBPA_UPDATE
Message-ID: <20220701143401.GA28408@willie-the-truck>
References: <20220630063959.27226-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220630063959.27226-1-burzalodowa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Jun 30, 2022 at 09:39:59AM +0300, Xenia Ragiadakou wrote:
> The expression 1 << 31 results in undefined behaviour because the type of
> integer constant 1 is (signed) int and the result of shifting 1 by 31 bits
> is not representable in the (signed) int type.
> 
> Change the type of 1 to unsigned int by adding the U suffix.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index cd48590ada30..44fbd499edea 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -96,7 +96,7 @@
>  #define CR2_E2H				(1 << 0)
>  
>  #define ARM_SMMU_GBPA			0x44
> -#define GBPA_UPDATE			(1 << 31)
> +#define GBPA_UPDATE			(1U << 31)

There are loads of these kicking around in the kernel sources and we compile
with -fno-strict-overflow.

If you really want to change these, then let's use the BIT() macro instead,
but I think it's really just churn.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
