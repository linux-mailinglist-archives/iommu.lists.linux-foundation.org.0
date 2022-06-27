Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A0455BAAC
	for <lists.iommu@lfdr.de>; Mon, 27 Jun 2022 17:13:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B59A4155A;
	Mon, 27 Jun 2022 15:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B59A4155A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTU_2Jn-m3LP; Mon, 27 Jun 2022 15:13:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 114FA410AF;
	Mon, 27 Jun 2022 15:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114FA410AF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6551C007E;
	Mon, 27 Jun 2022 15:13:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 711A9C002D
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 15:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 542D560BA3
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 15:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 542D560BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E46AcGUdTnVC for <iommu@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 15:13:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2FFC60B5D
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2FFC60B5D
 for <iommu@lists.linux-foundation.org>; Mon, 27 Jun 2022 15:13:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E8461758;
 Mon, 27 Jun 2022 08:13:26 -0700 (PDT)
Received: from [10.57.84.159] (unknown [10.57.84.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 132823F5A1;
 Mon, 27 Jun 2022 08:13:23 -0700 (PDT)
Message-ID: <2df8c1d1-fb83-5b92-d32a-6b8ba988844c@arm.com>
Date: Mon, 27 Jun 2022 16:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/5] iommu/io-pgtable-dart: Add DART PTE support for
 t6000
Content-Language: en-GB
To: Janne Grunau <j@jannau.net>, iommu@lists.linux-foundation.org
References: <20220621071848.14834-1-j@jannau.net>
 <20220621071848.14834-5-j@jannau.net>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220621071848.14834-5-j@jannau.net>
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Hector Martin <marcan@marcan.st>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Will Deacon <will@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022-06-21 08:18, Janne Grunau wrote:
> From: Sven Peter <sven@svenpeter.dev>
> 
> The DARTs present in the M1 Pro/Max/Ultra SoC use a diffent PTE format.
> They support a 42bit physical address space by shifting the paddr and
> extending its mask inside the PTE.
> They also come with mandatory sub-page protection now which we just
> configure to always allow access to the entire page. This feature is
> already present but optional on the previous DARTs which allows to
> unconditionally configure it.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ---
> 
> Changes in v3:
> - apply change to io-pgtable-dart.c
> - handle pte <> paddr conversion based on the pte format instead of
>    the output address size
> 
> Changes in v2:
> - add APPLE_DART2 PTE format
> 
>   drivers/iommu/io-pgtable-dart.c | 51 +++++++++++++++++++++++++++------
>   drivers/iommu/io-pgtable.c      |  1 +
>   include/linux/io-pgtable.h      |  1 +
>   3 files changed, 45 insertions(+), 8 deletions(-)
> 
[...]
> @@ -536,7 +571,7 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>   	if (!cfg->coherent_walk)
>   		return NULL;
>   
> -	if (cfg->oas > 36)
> +	if (cfg->oas != 36 && cfg->oas != 42)
>   		return NULL;

Wouldn't it make sense to tie this to the format? Maybe 36-bit OAS is 
still valid with v2, but presumably 42-bit with v1 definitely isn't.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
