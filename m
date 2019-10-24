Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E1E27F5
	for <lists.iommu@lfdr.de>; Thu, 24 Oct 2019 04:01:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AF6C5B9E;
	Thu, 24 Oct 2019 02:01:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C80A3B6D
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 02:01:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5020E831
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 02:01:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3BD0B68BE1; Thu, 24 Oct 2019 04:01:40 +0200 (CEST)
Date: Thu, 24 Oct 2019 04:01:40 +0200
From: "hch@lst.de" <hch@lst.de>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [RFC PATCH 1/3] dma-mapping: introduce a new dma api
	dma_addr_to_phys_addr()
Message-ID: <20191024020140.GA6057@lst.de>
References: <20191022125502.12495-1-laurentiu.tudor@nxp.com>
	<20191022125502.12495-2-laurentiu.tudor@nxp.com>
	<62561dca-cdd7-fe01-a0c3-7b5971c96e7e@arm.com>
	<50a42575-02b2-c558-0609-90e2ad3f515b@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50a42575-02b2-c558-0609-90e2ad3f515b@nxp.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Madalin-cristian Bucur <madalin.bucur@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leo Li <leoyang.li@nxp.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>
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

On Wed, Oct 23, 2019 at 11:53:41AM +0000, Laurentiu Tudor wrote:
> We had an internal discussion over these points you are raising and 
> Madalin (cc-ed) came up with another idea: instead of adding this prone 
> to misuse api how about experimenting with a new dma unmap and dma sync 
> variants that would return the physical address by calling the newly 
> introduced dma map op. Something along these lines:
>   * phys_addr_t dma_unmap_page_ret_phys(...)
>   * phys_addr_t dma_unmap_single_ret_phys(...)
>   * phys_addr_t dma_sync_single_for_cpu_ret_phys(...)
> I'm thinking that this proposal should reduce the risks opened by the 
> initial variant.
> Please let me know what you think.

I'm not sure what the ret is supposed to mean, but I generally like
that idea better.  We also need to make sure there is an easy way
to figure out if these APIs are available, as they generally aren't
for any non-IOMMU API IOMMU drivers.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
