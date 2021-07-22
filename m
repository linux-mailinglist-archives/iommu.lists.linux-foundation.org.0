Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 649DB3D21D2
	for <lists.iommu@lfdr.de>; Thu, 22 Jul 2021 12:10:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C2B605A6;
	Thu, 22 Jul 2021 10:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Fb0pUxgKFve; Thu, 22 Jul 2021 10:10:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2AA13600CC;
	Thu, 22 Jul 2021 10:10:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07CFDC001F;
	Thu, 22 Jul 2021 10:10:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC1C8C000E
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 10:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3A678290B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 10:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WtfT3WiUjfMR for <iommu@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 10:10:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834D7828F8
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 10:10:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56BBC106F;
 Thu, 22 Jul 2021 03:10:31 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DF3C3F73D;
 Thu, 22 Jul 2021 03:10:30 -0700 (PDT)
Subject: Re: [PATCH] dma-debug: fix debugfs initialization order
To: Anthony Iliopoulos <ailiop@suse.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210722091818.13434-1-ailiop@suse.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1ea36b32-9bbc-a611-402d-9fa196eda166@arm.com>
Date: Thu, 22 Jul 2021 11:10:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722091818.13434-1-ailiop@suse.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On 2021-07-22 10:18, Anthony Iliopoulos wrote:
> Due to link order, dma_debug_init is called before debugfs has a chance
> to initialize (via debugfs_init which also happens in the core initcall
> stage), so the directories for dma-debug are never created.
> 
> Move the dma_debug_init initcall from core to postcore stage so that
> debugfs will already be initialized by the time this is called, making
> it oblivious to link-ordering.

Playing initcall chicken here doesn't work so well - the later you 
initialise dma-debug itself, the more chance it has to miss early 
mappings and raise false positives later. As discussed previously[1] the 
better solution would be to decouple the debugfs setup so that just that 
part can be deferred until core_initcall_sync or later.

Robin.

[1] https://lore.kernel.org/linux-iommu/YIgGa6yF%2Fadg8OSN@kroah.com/

> Fixes: 15b28bbcd567 ("dma-debug: move initialization to common code")
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
> ---
>   kernel/dma/debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index 14de1271463f..49d80ef7f995 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -915,7 +915,7 @@ static int dma_debug_init(void)
>   	pr_info("debugging enabled by kernel config\n");
>   	return 0;
>   }
> -core_initcall(dma_debug_init);
> +postcore_initcall(dma_debug_init);
>   
>   static __init int dma_debug_cmdline(char *str)
>   {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
