Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F9225788
	for <lists.iommu@lfdr.de>; Mon, 20 Jul 2020 08:23:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 195B2204A1;
	Mon, 20 Jul 2020 06:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgxiWhgUFDbJ; Mon, 20 Jul 2020 06:23:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DC0662049F;
	Mon, 20 Jul 2020 06:23:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD847C016F;
	Mon, 20 Jul 2020 06:23:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A7D6C016F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 06:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6B894880E7
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 06:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNskyFGDuSsl for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 06:23:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 15765880E0
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 06:23:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AC9E368BFE; Mon, 20 Jul 2020 08:23:39 +0200 (CEST)
Date: Mon, 20 Jul 2020 08:23:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] dma-debug: use named initializers for dir2name
Message-ID: <20200720062339.GB10878@lst.de>
References: <20200716150112.476896-1-hch@lst.de>
 <c31374eb-855a-839b-5d52-96bc93ca69f3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c31374eb-855a-839b-5d52-96bc93ca69f3@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>
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

On Thu, Jul 16, 2020 at 05:12:30PM +0100, Robin Murphy wrote:
>> +static const char *dir2name[4] = {
>
> Nit: I think you can probably drop the explicit array size here.
>
> Otherwise, very welcome clarity!
>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Applied with the explicit array size removed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
