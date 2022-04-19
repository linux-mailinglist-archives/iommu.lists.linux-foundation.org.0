Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D65070D9
	for <lists.iommu@lfdr.de>; Tue, 19 Apr 2022 16:42:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F4A8322E;
	Tue, 19 Apr 2022 14:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W67LZNshMgwM; Tue, 19 Apr 2022 14:42:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E2FB783143;
	Tue, 19 Apr 2022 14:42:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC637C0088;
	Tue, 19 Apr 2022 14:42:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B4DEC002C
 for <iommu@lists.linux-foundation.org>; Tue, 19 Apr 2022 14:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDA1E8316F
 for <iommu@lists.linux-foundation.org>; Tue, 19 Apr 2022 14:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJZCDic_Af0S for <iommu@lists.linux-foundation.org>;
 Tue, 19 Apr 2022 14:42:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F83083143
 for <iommu@lists.linux-foundation.org>; Tue, 19 Apr 2022 14:42:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58C33614D2;
 Tue, 19 Apr 2022 14:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94C2C385A7;
 Tue, 19 Apr 2022 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650379334;
 bh=8U3kOAkP8r3tY5esyIBlcm2h6NMZv9H6akvf7zELYMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WS1kZShIt+dmp/9oGVSwk8nSf3Iw3FCqZ8foPjBQyglkkYKSV4P+xNqXGCmJ/F0kL
 YIuwELlsokI8JHK5+R0hpc/1R2SMAMT9utdQGJJfOfb3DuqVQlwPb1lP2jQqwG4Cec
 o5QIEOeMxhoxOfnh4j6sjSvav36p77IypYkuXgvDv9marwj+XNQDCHDfcDB3ITl++S
 7jIpEpORO8XtUbchC7jmN1eHH6EOOcqchG+pOcWmcqE3c8KM7z9oEKAiJdjHAQltzr
 C9Qf/WO6G5hJ2tANjbrf7xWZcPA+iE8G/680dD9yBUyePB75nEj6MPZDcZiYBn5UJr
 C3QDeywlaYbFg==
Date: Tue, 19 Apr 2022 15:42:08 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 05/13] iommu/arm-smmu-v3: Clean up bus_set_iommu()
Message-ID: <20220419144207.GB6186@willie-the-truck>
References: <cover.1649935679.git.robin.murphy@arm.com>
 <4c55ff48992ee8c2a81a38c859dc817ecacd8517.1649935679.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c55ff48992ee8c2a81a38c859dc817ecacd8517.1649935679.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jean-philippe@linaro.org, zhang.lyra@gmail.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 gerald.schaefer@linux.ibm.com
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

On Thu, Apr 14, 2022 at 01:42:34PM +0100, Robin Murphy wrote:
> Stop calling bus_set_iommu() since it's now unnecessary, and simplify
> the probe failure path accordingly.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 53 +--------------------
>  1 file changed, 2 insertions(+), 51 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
