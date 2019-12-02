Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3429110EDA0
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 18:00:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD38D86912;
	Mon,  2 Dec 2019 17:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJR9Hi1RCqvR; Mon,  2 Dec 2019 17:00:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B3B6286824;
	Mon,  2 Dec 2019 17:00:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E974C087F;
	Mon,  2 Dec 2019 17:00:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B6F8C087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 17:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2471288687
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 17:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gROoy4+icjr2 for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 17:00:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCA2B88187
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 17:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G2ll8x21H3OwfR6X73OWEUXv71XKn2fRqBpOxb8mfV8=; b=jin1Ceu89T016/r57qJ2013T1
 hr1+t0iWlp+orW8JGDLHPv23c8AqgtSjLpocGr/ZnxxnFPEr74z/yAfYrJYh6c097LzAzkhZb+CRW
 iZpTGwMLzjCXcK90KmToPX6phwgXBVCTTpAIDVhcL4kmMwKb23mqiUrL5xWRAoJD3Kkk//jAYfqFH
 zt0ZtF+d8xP5Kp8S2ve+ptn9bOC1kWdkBeaI6set11hILW3ZWuNX8VguaykW67r3nZZrfRPhPvOmJ
 G4M94kGTyCgt81ywBOrEXIo6VSlxxmeRzQi/yhZf+S6Gq6nvcYSVJXMPb148ryREcJHx4jwPvMbOw
 MCiah4RJQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ibp3T-0000jZ-A1; Mon, 02 Dec 2019 17:00:11 +0000
Date: Mon, 2 Dec 2019 09:00:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2] iommu/amd: Disable IOMMU on Stoney Ridge systems
Message-ID: <20191202170011.GC30032@infradead.org>
References: <20191129142154.29658-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129142154.29658-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Alex Deucher <alexander.deucher@amd.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Fri, Nov 29, 2019 at 10:21:54PM +0800, Kai-Heng Feng wrote:
> Serious screen flickering when Stoney Ridge outputs to a 4K monitor.
> 
> According to Alex Deucher, IOMMU isn't enabled on Windows, so let's do
> the same here to avoid screen flickering on 4K monitor.

Disabling the IOMMU entirely seem pretty severe.  Isn't it enough to
identity map the GPU device?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
