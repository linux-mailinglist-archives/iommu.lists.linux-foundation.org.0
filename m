Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAD18E594
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 09:36:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 999ECB2F;
	Thu, 15 Aug 2019 07:36:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DFBA2AC7
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 07:36:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 778A6CF
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 07:36:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B09A868AFE; Thu, 15 Aug 2019 09:36:04 +0200 (CEST)
Date: Thu, 15 Aug 2019 09:36:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 7/8] parisc: don't set ARCH_NO_COHERENT_DMA_MMAP
Message-ID: <20190815073604.GA24511@lst.de>
References: <20190808160005.10325-1-hch@lst.de>
	<20190808160005.10325-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808160005.10325-8-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
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

Helger, or other parisc folks: can you take a look at this patch
in particular and the series in general?  Thanks!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
