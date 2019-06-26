Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A588C569C5
	for <lists.iommu@lfdr.de>; Wed, 26 Jun 2019 14:54:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 01756D07;
	Wed, 26 Jun 2019 12:54:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6119C8F
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 12:53:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6C230831
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 12:53:58 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 57FB268B05; Wed, 26 Jun 2019 14:53:25 +0200 (CEST)
Date: Wed, 26 Jun 2019 14:53:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: SATA broken with LPAE
Message-ID: <20190626125325.GA4744@lst.de>
References: <16f065ef-f4ac-46b4-de2a-6b5420ae873a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16f065ef-f4ac-46b4-de2a-6b5420ae873a@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: axboe@kernel.dk, Vignesh Raghavendra <vigneshr@ti.com>,
	martin.petersen@oracle.com, linux-ide@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>, jejb@linux.ibm.com, "Nori,
	Sekhar" <nsekhar@ti.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	iommu@lists.linux-foundation.org, rmk+kernel@arm.linux.org.uk,
	linux-omap@vger.kernel.org, hch@lst.de
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

Hi Roger,

it seems the arm dma direct mapping code isn't doing the right thing
here.  On other platforms that have > 4G memory we always use swiotlb
for bounce buffering in case a device that can't DMA to all the memory.

Arm is the odd one out and uses its own dmabounce framework instead,
but it seems like it doesn't get used in this case.  We need to make
sure dmabounce (or swiotlb for that matter) is set up if > 32-bit
addressing is supported.  I'm not really an arm platform expert,
but some of those on the Cc list are and might chime in on how to
do that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
