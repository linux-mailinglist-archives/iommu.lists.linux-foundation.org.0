Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B74AB3E486C
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 17:15:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54967401C5;
	Mon,  9 Aug 2021 15:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kp_mBRab_KLW; Mon,  9 Aug 2021 15:15:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 78BA4401D3;
	Mon,  9 Aug 2021 15:15:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B9B7C000E;
	Mon,  9 Aug 2021 15:15:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7387FC000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 15:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F4FE8250B
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 15:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFZZqFdtHXbv for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 15:15:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB98824C1
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 15:15:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BB09C67357; Mon,  9 Aug 2021 17:15:43 +0200 (CEST)
Date: Mon, 9 Aug 2021 17:15:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anthony Iliopoulos <ailiop@suse.com>
Subject: Re: [PATCH] dma-debug: fix debugfs initialization order
Message-ID: <20210809151543.GA22395@lst.de>
References: <20210722091818.13434-1-ailiop@suse.com>
 <1ea36b32-9bbc-a611-402d-9fa196eda166@arm.com> <YPl8b7KuoNBg52LE@technoir>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPl8b7KuoNBg52LE@technoir>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Thanks, applied.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
