Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E0135379
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 08:06:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BBADC8684A;
	Thu,  9 Jan 2020 07:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTGZKy1Uplnt; Thu,  9 Jan 2020 07:06:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31DAA86837;
	Thu,  9 Jan 2020 07:06:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17CFCC0881;
	Thu,  9 Jan 2020 07:06:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52029C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 07:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3E37C85E28
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 07:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVZB79SpQwJF for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 07:06:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C8F8A85DC1
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpxaB8Q7itq3k+tRSDvcee9rmzcfkSV709xu5sMF3B4=; b=LKpIQBiSTywXAHkUcraQ3KEVw
 tHRSa1x65QN4h0wDIglQiZhrFJjXGUpCOIwDZHWa+6hS5ZKUZRp09DK9YUzBLnAdi3XUNHY9CPisE
 hrUsZBpv3c6YX2f/7R939FtVh+5V9MwP6BXEewCKnm40PFnASj7cf2NeYPz0/ZxUJJll5KAwmla0K
 TSut0cY1bktxJbgBNl4LSCRY0ENomwdCqz6VECMAoazgQSOJ/U7TP3EAZQM/YVmG8D0wlJVEmv5Tp
 ah8W/C0tFXnTNPC6GXcDVtIfnez9g3eWR9er/2n184HLaYaKXt/q6aXdViVFhM5FoFN1zoC+DY2Z8
 SOgmFCF2w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ipRty-0003eL-23; Thu, 09 Jan 2020 07:06:42 +0000
Date: Wed, 8 Jan 2020 23:06:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 22/22] iommu/vt-d: Add a quirk flag for scope mismatched
 devices
Message-ID: <20200109070642.GA13212@infradead.org>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
 <20200102001823.21976-23-baolu.lu@linux.intel.com>
 <20200108141603.GA11875@infradead.org>
 <d73ac0f4-b347-8f59-d2a7-8eeee142ed8d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d73ac0f4-b347-8f59-d2a7-8eeee142ed8d@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Roland Dreier <roland@purestorage.com>, Jim Yan <jimyan@baidu.com>,
 iommu@lists.linux-foundation.org
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

On Thu, Jan 09, 2020 at 07:28:41AM +0800, Lu Baolu wrote:
> This patch has been replaced with this one.
> 
> https://lkml.org/lkml/2020/1/5/103

That still mentions a "nvme host device", which despite the different
spelling still doesn't make any sense.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
