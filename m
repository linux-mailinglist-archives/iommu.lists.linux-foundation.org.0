Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1B3204AEB
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 09:22:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DFE0E8876B;
	Tue, 23 Jun 2020 07:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjPQn5ZesFKI; Tue, 23 Jun 2020 07:22:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 84C4388D7C;
	Tue, 23 Jun 2020 07:22:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C8BFC016F;
	Tue, 23 Jun 2020 07:22:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59FFFC016F
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 07:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4892A88432
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 07:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c61OXA52WmYJ for <iommu@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 07:22:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DF43E88426
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 07:22:45 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D458668AEF; Tue, 23 Jun 2020 09:22:40 +0200 (CEST)
Date: Tue, 23 Jun 2020 09:22:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 14/15] docs: fix references for DMA*.txt files
Message-ID: <20200623072240.GA974@lst.de>
References: <cover.1592895969.git.mchehab+huawei@kernel.org>
 <37b2fd159fbc7655dbf33b3eb1215396a25f6344.1592895969.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37b2fd159fbc7655dbf33b3eb1215396a25f6344.1592895969.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-pci@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jun 23, 2020 at 09:09:10AM +0200, Mauro Carvalho Chehab wrote:
> As we moved those files to core-api, fix references to point
> to their newer locations.

Can we please just revert the RST conversion that I didn't ACK?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
