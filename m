Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F81A47C8
	for <lists.iommu@lfdr.de>; Fri, 10 Apr 2020 17:15:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 49ED487DC4;
	Fri, 10 Apr 2020 15:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtXuw3hQxeYN; Fri, 10 Apr 2020 15:15:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71B5487CB0;
	Fri, 10 Apr 2020 15:15:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66CE6C0177;
	Fri, 10 Apr 2020 15:15:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50544C0177
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 15:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 493368677E
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 15:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBuyCO37RePm for <iommu@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 15:15:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167])
 by whitealder.osuosl.org (Postfix) with SMTP id 461B687CB0
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 15:15:42 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.246.227.120])
 by sina.com with ESMTP
 id 5E9088E1000319C1; Fri, 10 Apr 2020 22:55:33 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 511795629009
From: Hillf Danton <hdanton@sina.com>
To: David Rientjes <rientjes@google.com>
Subject: Re: [rfc v2 3/6] dma-pool: dynamically expanding atomic pools
Date: Fri, 10 Apr 2020 22:55:20 +0800
Message-Id: <20200410145520.17864-1-hdanton@sina.com>
In-Reply-To: <alpine.DEB.2.21.2004081418490.19661@chino.kir.corp.google.com>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <b22416ec-cc28-3fd2-3a10-89840be173fa@amd.com>
 <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2004081418490.19661@chino.kir.corp.google.com>
MIME-Version: 1.0
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "Grimm, Jon" <jon.grimm@amd.com>,
 linux <linux-kernel@vger.kernel.org>, iommu <iommu@lists.linux-foundation.org>,
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


On Wed, 8 Apr 2020 14:21:06 -0700 (PDT) David Rientjes wrote:
> 
> When an atomic pool becomes fully depleted because it is now relied upon
> for all non-blocking allocations through the DMA API, allow background
> expansion of each pool by a kworker.
> 
> When an atomic pool has less than the default size of memory left, kick
> off a kworker to dynamically expand the pool in the background.  The pool
> is doubled in size, up to MAX_ORDER-1.  If memory cannot be allocated at
> the requested order, smaller allocation(s) are attempted.
> 
What is proposed looks like a path of single lane without how to
dynamically shrink the pool taken into account. Thus the risk may
rise in corner cases where pools are over-expanded in long run
after one-off peak allocation requests.

Is it worth the complexity of expander + shrinker at the first place?

> This allows the default size to be kept quite low when one or more of the
> atomic pools is not used.
> 
> This also allows __dma_atomic_pool_init to return a pointer to the pool
> to make initialization cleaner.
> 
> Also switch over some node ids to the more appropriate NUMA_NO_NODE.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
