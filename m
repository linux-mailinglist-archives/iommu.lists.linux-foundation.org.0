Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BADD25D5B3
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 12:10:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4382D8751D;
	Fri,  4 Sep 2020 10:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcJ0nidc6Ps9; Fri,  4 Sep 2020 10:10:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE52887519;
	Fri,  4 Sep 2020 10:10:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0992C0051;
	Fri,  4 Sep 2020 10:10:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACD3AC0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 10:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A13F98735C
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 10:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BA-kaxL3P5db for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 10:10:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D0CE3870BB
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 10:10:03 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6542D3D5; Fri,  4 Sep 2020 12:10:02 +0200 (CEST)
Date: Fri, 4 Sep 2020 12:10:01 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/iova: Replace cmpxchg with xchg in queue_iova
Message-ID: <20200904101000.GV6714@8bytes.org>
References: <1598517834-30275-1-git-send-email-zhangshaokun@hisilicon.com>
 <20200904093732.GN6714@8bytes.org>
 <208d2f74-1a04-f01e-b885-c175b0480784@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <208d2f74-1a04-f01e-b885-c175b0480784@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, Yuqi Jin <jinyuqi@huawei.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Robin,

On Fri, Sep 04, 2020 at 10:58:14AM +0100, Robin Murphy wrote:
> On 2020-09-04 10:37, Joerg Roedel wrote:
> > Adding Robin.
> 
> Did you miss that I've reviewed this already? :)
> 
> https://lore.kernel.org/linux-iommu/3afcc7b2-0bfb-b79c-513f-1beb66c5f164@arm.com/

Hmm, that mail wasn't in my inbox, but b4 found it. I'll need to look
why it didn't make it...


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
