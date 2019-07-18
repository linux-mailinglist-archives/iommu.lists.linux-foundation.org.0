Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A37D6D34C
	for <lists.iommu@lfdr.de>; Thu, 18 Jul 2019 19:57:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DBB6C1B1A;
	Thu, 18 Jul 2019 17:57:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B7C591B19
	for <iommu@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 17:56:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 90C9825A
	for <iommu@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 17:56:58 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C28C468B02; Thu, 18 Jul 2019 19:56:55 +0200 (CEST)
Date: Thu, 18 Jul 2019 19:56:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Subject: Re: [PATCH v3 4/6] x86,s390/mm: Move sme_active() and sme_me_mask
	to x86-specific header
Message-ID: <20190718175655.GA361@lst.de>
References: <20190718032858.28744-1-bauerman@linux.ibm.com>
	<20190718032858.28744-5-bauerman@linux.ibm.com>
	<cf48e778-130a-df2a-d94b-170bd85d692c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf48e778-130a-df2a-d94b-170bd85d692c@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Mike Anderson <andmike@linux.ibm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"x86@kernel.org" <x86@kernel.org>, Ram Pai <linuxram@us.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
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

On Thu, Jul 18, 2019 at 05:42:18PM +0000, Lendacky, Thomas wrote:
> You may want to try and build the out-of-tree nvidia driver just to be
> sure you can remove the EXPORT_SYMBOL(). But I believe that was related
> to the DMA mask check, which now removed, may no longer be a problem.

Out of tree driver simply don't matter for kernel development decisions.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
