Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C81D79E6
	for <lists.iommu@lfdr.de>; Mon, 18 May 2020 15:32:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D729D20797;
	Mon, 18 May 2020 13:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lzMZsEVeeSt; Mon, 18 May 2020 13:32:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8BFB920794;
	Mon, 18 May 2020 13:32:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68218C0888;
	Mon, 18 May 2020 13:32:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49954C07FF
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 377A18821D
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCcbGIy1bXlQ for <iommu@lists.linux-foundation.org>;
 Mon, 18 May 2020 13:32:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 79AC488193
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 13:32:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89A9AACCE;
 Mon, 18 May 2020 13:32:14 +0000 (UTC)
Date: Mon, 18 May 2020 15:32:09 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [Regression] "iommu/amd: Relax locking in dma_ops path" makes
 tg3 ethernet transmit queue timeout
Message-ID: <20200518133209.GM8135@suse.de>
References: <4E9B03FB-9DA5-4831-B4CE-A0AA645D3F22@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E9B03FB-9DA5-4831-B4CE-A0AA645D3F22@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, open list <linux-kernel@vger.kernel.org>
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

On Mon, May 18, 2020 at 05:06:45PM +0800, Kai-Heng Feng wrote:
> Particularly, as soon as the spinlock is removed, the issue can be reproduced.
> Function domain_flush_complete() doesn't seem to affect the status.
> 
> However, the .map_page callback was removed by be62dbf554c5
> ("iommu/amd: Convert AMD iommu driver to the dma-iommu api"), so
> there's no easy revert for this issue.
> 
> This is still reproducible as of today's mainline kernel, v5.7-rc6.

Is there any error message from the IOMMU driver?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
