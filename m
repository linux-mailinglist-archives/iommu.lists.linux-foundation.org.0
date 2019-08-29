Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C9477A1C7C
	for <lists.iommu@lfdr.de>; Thu, 29 Aug 2019 16:14:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E7E04709;
	Thu, 29 Aug 2019 14:14:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5D33C4400
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 14:13:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DF3D913A
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 14:13:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6E34F68B20; Thu, 29 Aug 2019 16:13:07 +0200 (CEST)
Date: Thu, 29 Aug 2019 16:13:07 +0200
From: "hch@lst.de" <hch@lst.de>
To: "Derrick, Jonathan" <jonathan.derrick@intel.com>
Subject: Re: [PATCH 2/5] x86/pci: Add a to_pci_sysdata helper
Message-ID: <20190829141307.GA18677@lst.de>
References: <20190828141443.5253-1-hch@lst.de>
	<20190828141443.5253-3-hch@lst.de>
	<809ad38b6aca8e828db7be6423cb03ac9208fb5a.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <809ad38b6aca8e828db7be6423cb03ac9208fb5a.camel@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "hch@lst.de" <hch@lst.de>
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

On Wed, Aug 28, 2019 at 04:41:45PM +0000, Derrick, Jonathan wrote:
> > diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
> > index 6fa846920f5f..75fe28492290 100644
> > --- a/arch/x86/include/asm/pci.h
> > +++ b/arch/x86/include/asm/pci.h
> > @@ -35,12 +35,15 @@ extern int noioapicreroute;
> >  
> >  #ifdef CONFIG_PCI
> >  
> > +static inline struct pci_sysdata *to_pci_sysdata(struct pci_bus *bus)
> Can you make the argument const to avoid all the warnings from callers
> passing const struct pci_bus

Yes, I already fixed this up after getting a build bot warning for a
NUMA config (which seems to be the only one passing a const).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
