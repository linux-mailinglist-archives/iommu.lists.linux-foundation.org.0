Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16444AF74
	for <lists.iommu@lfdr.de>; Tue,  9 Nov 2021 15:27:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B8C7400AA;
	Tue,  9 Nov 2021 14:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZML2E031_DMM; Tue,  9 Nov 2021 14:27:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A2777403DB;
	Tue,  9 Nov 2021 14:27:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 679C5C0021;
	Tue,  9 Nov 2021 14:27:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FD34C000E
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F271880F13
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqBJNzxuotdE for <iommu@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 14:27:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7577F80CF7
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:27:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4500A67373; Tue,  9 Nov 2021 15:27:23 +0100 (CET)
Date: Tue, 9 Nov 2021 15:27:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 06/10] dma-direct: refactor the !coherent checks in
 dma_direct_alloc
Message-ID: <20211109142722.GE23489@lst.de>
References: <20211021090611.488281-1-hch@lst.de>
 <20211021090611.488281-7-hch@lst.de>
 <1732d247-e82a-2250-d12e-0d5988d670a9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1732d247-e82a-2250-d12e-0d5988d670a9@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 David Rientjes <rientjes@google.com>
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

On Thu, Nov 04, 2021 at 12:36:08PM +0000, Robin Murphy wrote:
> How about:
> 		remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
>
> 		if (remap && ...)
>
> for a bit less indentation? FWIW I reckon it's slightly more obvious that 
> way round.

Done.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
