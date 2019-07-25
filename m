Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0597473A
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 08:34:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 367CF1631;
	Thu, 25 Jul 2019 06:34:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8E9021574
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 06:34:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4A23D224
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LxRzrmqNwWXEcTNqN3l9QmLeMxibMu/ZcBBkXbQrVyw=;
	b=sSnqsD3xQllFI83sT8h2y1ez1
	1+NR5rILrzn2fx0DuMS6EJFmwNO2XExgFACUjDedABMEkNIU+rd/3LQBIAijY+FYAPHBgRyh+iWj/
	IpUfZWjQUrOov9ACuWzZIpk8dEQvTgwxjZToBUZbDwwD1Q958u7eCSs6OWQKRiJiov29n3YEoK6Kx
	wZKMqYHH4+emQ89aJMh4HOldAgXeQl37NVAViusOoKrxseDk/BtaZuGi/S6ipg1+Q3ABquMo/NZB9
	3x49mtJERY+aV+t7Eevu+qlkEmOHGvaN5oa5/vwxNtpHmx+2jAwE/AJHn0l+gvbqKEdkQH9QIBqnW
	BzSzvrgfw==;
Received: from p57b3f613.dip0.t-ipconnect.de ([87.179.246.19] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hqXKH-0000FL-DN; Thu, 25 Jul 2019 06:34:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: remove default fallbacks in dma_map_ops
Date: Thu, 25 Jul 2019 08:33:56 +0200
Message-Id: <20190725063401.29904-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org
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

we have a few places where the DMA mapping layer has non-trivial default
actions that are questionable and/or dangerous.

This series instead wires up the mmap, get_sgtable and get_required_mask
methods explicitly and cleans up some surrounding areas.  This also means
we could get rid of the ARCH_NO_COHERENT_DMA_MMAP kconfig option, as we
now require a mmap method wired up, or in case of non-coherent dma-direct
the presence of the arch_dma_coherent_to_pfn hook.  The only interesting
case is that the sound code also checked the ARCH_NO_COHERENT_DMA_MMAP
symbol in somewhat odd ways, so I'd like to see a review of the sound
situation before going forward with that patch.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
