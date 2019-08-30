Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B51EA34FF
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 12:33:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E528C5DC1;
	Fri, 30 Aug 2019 10:33:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 67B735D1C
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 10:31:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F0A993D0
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 10:31:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 21EFB1D5; Fri, 30 Aug 2019 12:31:51 +0200 (CEST)
Date: Fri, 30 Aug 2019 12:31:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v7 1/7] iommu/vt-d: Don't switch off swiotlb if use
	direct dma
Message-ID: <20190830103150.GB29382@8bytes.org>
References: <20190823071735.30264-1-baolu.lu@linux.intel.com>
	<20190823071735.30264-2-baolu.lu@linux.intel.com>
	<20190823083956.GB24194@8bytes.org>
	<8fb96c3b-c535-6d90-e1e1-c635aec6f178@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fb96c3b-c535-6d90-e1e1-c635aec6f178@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alan.cox@intel.com, Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Jonathan Corbet <corbet@lwn.net>, pengfei.xu@intel.com,
	Ingo Molnar <mingo@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, kevin.tian@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, Robin Murphy <robin.murphy@arm.com>
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

On Sat, Aug 24, 2019 at 10:17:30AM +0800, Lu Baolu wrote:
> If a system has any external port, through which an untrusted device
> might be connected, the external port itself should be marked as an
> untrusted device, and all devices beneath it just inherit this
> attribution.

Okay, makes sense.

> So during iommu driver initialization, we can easily know whether the
> system has (or potentially has) untrusted devices by iterating the
> device tree. I will add such check in the next version if no objections.

Sounds good, thanks Baolu.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
