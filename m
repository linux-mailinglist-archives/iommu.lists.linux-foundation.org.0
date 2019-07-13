Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7376793D
	for <lists.iommu@lfdr.de>; Sat, 13 Jul 2019 10:17:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D27C69F8;
	Sat, 13 Jul 2019 08:17:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 950C563D8
	for <iommu@lists.linux-foundation.org>;
	Sat, 13 Jul 2019 08:08:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3879363D
	for <iommu@lists.linux-foundation.org>;
	Sat, 13 Jul 2019 08:08:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 77F8B68B02; Sat, 13 Jul 2019 10:08:30 +0200 (CEST)
Date: Sat, 13 Jul 2019 10:08:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 3/3] fs/core/vmcore: Move sev_active() reference to x86
	arch code
Message-ID: <20190713080829.GA17920@lst.de>
References: <20190712053631.9814-1-bauerman@linux.ibm.com>
	<20190712053631.9814-4-bauerman@linux.ibm.com>
	<20190712150912.3097215e.pasic@linux.ibm.com>
	<20190712140812.GA29628@lst.de>
	<20190712165153.78d49095.pasic@linux.ibm.com>
	<20190712151129.GA30636@lst.de>
	<20190712174249.33b74535.pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712174249.33b74535.pasic@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Mike Anderson <andmike@linux.ibm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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

On Fri, Jul 12, 2019 at 05:42:49PM +0200, Halil Pasic wrote:
> 
> Will do! I guess I should do the patch against the for-next branch of the
> dma-mapping tree. But that branch does not have the s390 support patches (yet?).
> To fix it I need both e67a5ed1f86f and 64e1f0c531d1 "s390/mm: force
> swiotlb for protected virtualization" (Halil Pasic, 2018-09-13). Or
> should I wait for e67a5ed1f86f landing in mainline?

I've rebased the dma-mapping for-next branch to latest mainline as of
today that has both commits.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
