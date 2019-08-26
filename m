Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD29C9C6
	for <lists.iommu@lfdr.de>; Mon, 26 Aug 2019 09:03:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6BF7DFC1;
	Mon, 26 Aug 2019 07:03:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C2AA9FB0
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 07:02:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 83D8D8A2
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 07:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vQdGwgOl/ZuixO8xiaxR0SLvVclg7jbER1lHT9uHlSw=;
	b=cC/zQtbnFSNOJ4AGthbXchZG8
	lbmTP1GvBSs4HWWYLJ0ra2aQ+XGlYoBWdyrn4xGHX+hgyI7yDmqRQLJoqjRmzf9dVF7jNwo6X4G0A
	nrm1tae/bxqa7aVzxlp1OD9zDVJUByem8LRzPXuI+bQHnT7shwEn7xRcvVLsEwYJDJz6/tJZrjwTl
	zrc8B5YKOEbDCb7pPTI24ab+G7tN/RDrTjqIcHr/y7kX6ugih0JMoQMgOFwW27hGTnK7ZCcAM5KU5
	0XkVKrAzwBvqMOUCwNwwBXGmD8E6w+5PE6yPP61/lfJ4/QqWnBflyAVdRIs5SMwobsQMpBdy60kuW
	J4wUJKiXw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1i291n-0008R1-2i; Mon, 26 Aug 2019 07:02:59 +0000
Date: Mon, 26 Aug 2019 00:02:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michal Simek <monstr@monstr.eu>, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: convert microblaze to the generic dma remap allocator
Message-ID: <20190826070258.GA31420@infradead.org>
References: <20190814140348.3339-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814140348.3339-1-hch@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Aug 14, 2019 at 04:03:46PM +0200, Christoph Hellwig wrote:
> Hi Michal,
> 
> can you take a look at this patch that moves microblaze over to the
> generic DMA remap allocator?  I've been trying to slowly get all
> architectures over to the generic code, and microblaze is one that
> seems very straightfoward to convert.

Michal, any chance you could look over this series?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
