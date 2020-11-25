Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 312832C479B
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 19:29:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BED0D87359;
	Wed, 25 Nov 2020 18:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ai1lJsA-7DTf; Wed, 25 Nov 2020 18:29:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57CA38717A;
	Wed, 25 Nov 2020 18:29:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40A28C0052;
	Wed, 25 Nov 2020 18:29:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1F93C0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8E7EB87228
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oriKSzOi-OOz for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 18:29:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4D8A18717A
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:29:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6C9CA68B02; Wed, 25 Nov 2020 19:29:41 +0100 (CET)
Date: Wed, 25 Nov 2020 19:29:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH] dma-mapping: Fix sizeof() mismatch on tsk allocation
Message-ID: <20201125182941.GB10377@lst.de>
References: <20201125140523.1880669-1-colin.king@canonical.com>
 <a6c5e5ed9a66485da301c1e91b56ccc7@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6c5e5ed9a66485da301c1e91b56ccc7@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Colin King <colin.king@canonical.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

I'll fold this one in as well.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
