Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF9813BA
	for <lists.iommu@lfdr.de>; Mon,  5 Aug 2019 09:56:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 57743CCE;
	Mon,  5 Aug 2019 07:56:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D1D14CCC
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 07:56:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 275115E4
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ifkk164wSodRUe+DyhW0NyzCEeL1GFBRdhMoo+ncAoI=;
	b=c7qBc9iRJLkZb/+Hrc7vzTp9A
	aIFiXx+1TD4IPx7FHWBk8vk4RUrJDS1GBc9L/3h0ZeHIDVDICAJ8GgUfsBApHTZnkbOYLM7m43+pg
	4NQXS6w9FfoGDs69bx2XKICVGSXCr5s7G5vcIzVWdGVltWBQlLvVzi1YJvOaCAKC1xb2G6btvSIOR
	aMkuRhufCncdzCyPzSuvoomAPfCkS7unfisV/zdMJnV8rc+kyjmFy05eM0GBkNuHtP8gDpH6efKhi
	F6a8lPszxMM8wD+FTgSmj6zQfHNqaTLQcP6qONVdGdDVo8z/up1nPwwvQYYVEbCE16nPWDqN5r/5l
	jERjME66A==;
Received: from [195.167.85.94] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1huXrF-0000xJ-5I; Mon, 05 Aug 2019 07:56:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: arm swiotlb fix
Date: Mon,  5 Aug 2019 10:56:36 +0300
Message-Id: <20190805075637.5373-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
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

Hi all,

my commit to add swiotlb to arm failed to initialize the atomic pool,
which is needed for GFP_ATOMIC allocations on non-coherent devices.
These are fairly rare, but exist so we should wire it up.  For 5.4
I plan to move the initilization to the common dma-remap code so it
won't be missed for other architectures.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
