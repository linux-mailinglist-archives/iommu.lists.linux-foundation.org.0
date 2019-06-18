Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C020E4A542
	for <lists.iommu@lfdr.de>; Tue, 18 Jun 2019 17:25:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6D85CC74;
	Tue, 18 Jun 2019 15:25:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 434BDC4E
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 15:25:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B4A81893
	for <iommu@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 15:25:20 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 188C34B5; Tue, 18 Jun 2019 17:25:19 +0200 (CEST)
Date: Tue, 18 Jun 2019 17:25:17 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] iommu: fix integer truncation
Message-ID: <20190618152517.GB21128@8bytes.org>
References: <20190617133101.2817807-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617133101.2817807-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Oza Pawandeep <poza@codeaurora.org>, Marc Zyngier <marc.zyngier@arm.com>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	Julien Grall <julien.grall@arm.com>,
	Srinath Mannam <srinath.mannam@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
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

On Mon, Jun 17, 2019 at 03:30:54PM +0200, Arnd Bergmann wrote:
> On 32-bit architectures, phys_addr_t may be different from dma_add_t,
> both smaller and bigger. This can lead to an overflow during an assignment
> that clang warns about:
> 
> drivers/iommu/dma-iommu.c:230:10: error: implicit conversion from 'dma_addr_t' (aka 'unsigned long long') to
>       'phys_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Werror,-Wconstant-conversion]
> 
> Use phys_addr_t here because that is the type that the variable was
> declared as.
> 
> Fixes: aadad097cd46 ("iommu/dma: Reserve IOVA for PCIe inaccessible DMA address")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
