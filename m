Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AD42F45CDC
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 14:31:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C966C3E;
	Fri, 14 Jun 2019 12:31:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B92C6CAC
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 12:31:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4EB7F775
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 12:31:11 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 3289D68AFE; Fri, 14 Jun 2019 14:30:42 +0200 (CEST)
Date: Fri, 14 Jun 2019 14:30:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] dma-remap: Avoid de-referencing NULL atomic_pool
Message-ID: <20190614123041.GB31052@lst.de>
References: <20190607234333.9776-1-f.fainelli@gmail.com>
	<20190610225437.10912-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610225437.10912-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alexey.skidanov@intel.com, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
	bcm-kernel-feedback-list@broadcom.com, akpm@linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, sjhuang@iluvatar.ai
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

Thanks,

applied to the dma-mapping for-next branch.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
