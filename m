Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E3B469F8F
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 16:48:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81C1C84B62;
	Mon,  6 Dec 2021 15:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HEgaN7nWTxi; Mon,  6 Dec 2021 15:48:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3AD8283E3A;
	Mon,  6 Dec 2021 15:48:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 712E4C006F;
	Mon,  6 Dec 2021 15:48:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C38EC0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 15:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22DAF40160
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="ht236YaY";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="qpqmyJ62"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ka5_Of7Yds0l for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 15:48:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3171400FB
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 15:48:01 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638805679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=spAnJwZVm8pxfwQA4Do9Y38VjUk5clCJipJp2dzk73g=;
 b=ht236YaYNTKLA+yaAutzvIoaRLPlExXQugf1SWCAR7g0MhuJ0WbgIr0navpy9WmrBwti0/
 maX5O7WDUulNyASyvFhHa7FIf9wN1+MAxrhupLC1nf3WNU77G100cM6sePc3pbNuU1kgDo
 lMwgOj39+BzmTckkyI7NnMI2FZDERsM+Bw+T72aw3KD00y4YcgxZPyqyw9XHbEUuWWO3kE
 r2C/kTGiXDIogYl9O5OezmCOd6hu5A2Vi7YpQU6rbBZ6OooVD8xtsSlQ0eLyxXu2EsOuO6
 2KCr/e72nNOzWDs+rue2Jnexf3HMNalvoAudeAGOY8dTBnPkbxuY/N570eA5bQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638805679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=spAnJwZVm8pxfwQA4Do9Y38VjUk5clCJipJp2dzk73g=;
 b=qpqmyJ62U1PiohRUaPu3n0sCY+pvWWUPM9t8NZ+nUnKXAVjISDF75+lOhP8EZmHh2Kyp0K
 auRc7S33PNKE4iDA==
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
In-Reply-To: <20211206144344.GA4670@nvidia.com>
References: <87r1av7u3d.ffs@tglx> <20211202135502.GP4670@nvidia.com>
 <87wnkm6c77.ffs@tglx> <20211202200017.GS4670@nvidia.com>
 <87o85y63m8.ffs@tglx> <20211203003749.GT4670@nvidia.com>
 <877dcl681d.ffs@tglx> <20211203164104.GX4670@nvidia.com>
 <87v9044fkb.ffs@tglx> <87o85v3znb.ffs@tglx>
 <20211206144344.GA4670@nvidia.com>
Date: Mon, 06 Dec 2021 16:47:58 +0100
Message-ID: <87fsr54tw1.ffs@tglx>
MIME-Version: 1.0
Cc: Allen Hubbe <allenbh@gmail.com>, linux-s390@vger.kernel.org,
 Kevin Tian <kevin.tian@intel.com>, x86@kernel.org,
 Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zygnier <maz@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Bjorn Helgaas <helgaas@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-pci@vger.kernel.org, linux-ntb@googlegroups.com,
 Logan Gunthorpe <logang@deltatee.com>, Megha Dey <megha.dey@intel.com>
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

Jason,

On Mon, Dec 06 2021 at 10:43, Jason Gunthorpe wrote:
> On Sun, Dec 05, 2021 at 03:16:40PM +0100, Thomas Gleixner wrote:
>> > That's not really a good idea because dev->irqdomain is a generic
>> > mechanism and not restricted to the PCI use case. Special casing it for
>> > PCI is just wrong. Special casing it for all use cases just to please
>> > PCI is equally wrong. There is a world outside of PCI and x86. 
>> 
>> That argument is actually only partially correct.
>
> I'm not sure I understood your reply? I think we are both agreeing
> that dev->irqdomain wants to be a generic mechanism?

Yes. I managed to confuse myself there by being too paranoid about how
to distinguish things on platforms which need to support both ways, i.e.
x86 when XEN is enabled.

> I'd say that today we've special cased it to handle PCI. IMHO that is
> exactly what pci_msi_create_irq_domain() is doing - it replaces the
> chip ops with ops that can *ONLY* do PCI MSI and so dev->irqdomain
> becomes PCI only and non-generic.

Right. See above. That's why I went back to my notes, did some more
research ...

>>   2) Guest support is strictly opt-in
>> 
>>      The underlying architecture/subarchitecture specific irqdomain has
>>      to detect at setup time (eventually early boot), whether the
>>      underlying hypervisor supports it.
>> 
>>      The only reasonable way to support that is the availability of
>>      interrupt remapping via vIOMMU, as we discussed before.
>
> This is talking about IMS specifically because of the legacy issue
> where the MSI addr/data pair inside a guest is often completely fake?

This is about IMS, right. PCI/MSI[x] is handled today because the writes
to the MSI/MSI-X message store can be trapped.

>>      That does not work in all cases due to architecture and host
>>      controller constraints, so we might end up with:
>> 
>>            VECTOR -> IOMMU -> SHIM -> PCI/[MSI/MSI-X/IMS] domains
>
> OK - I dont' know enough about the architecture/controller details to
> imagine what SHIM is, but if it allows keeping the PCI code as purely
> PCI code, then great

It's today part of the arch/subarch specific PCI/MSI domain to deal with
quirks above the IOMMU level. As we can't proliferate that into the new
endpoint domain, that needs to be done as a shim layer in between which
has no real other functionality than applying the quirks. Yes, it's all
pretty. Welcome to my wonderful world.

>>        - The irqchip callbacks which can be implemented by these top
>>          level domains are going to be restricted.
>
> OK - I think it is great that the driver will see a special ops struct
> that is 'ops for device's MSI addr/data pair storage'. It makes it
> really clear what it is

It will need some more than that, e.g. mask/unmask and as we discussed
quite some time ago something like the irq_buslock/unlock pair, so you
can handle updates to the state from thread context via a command queue
(IIRC).

>>        - For the irqchip callbacks which are allowed/required the rules
>>          vs. following down the hierarchy need to be defined and
>>          enforced.
>
> The driver should be the ultimate origin of the interrupt so it is
> always end-point in the hierarchy, opposite the CPU?
>
> I would hope the driver doesn't have an exposure to hierarchy?

No.
  
> So we have a new concept: 'device MSI storage ops'
>
> Put them along with the xarray holding the msi_descs and you've got my
> msi_table :)

Hehe.
  
>>      Sorry Jason, no tables for you. :)
>
> How does the driver select with 'device MSI storage ops' it is
> requesting a MSI for ?

Via some cookie, reference whatever as discussed in the other
mail. We'll bikeshed the naming once I get there :)

>>   1) I'm going to post part 1-3 of the series once more with the fallout
>>      and review comments addressed.
>
> OK, I didn't see anything in there that was making anything harder in
> this direction

It's helping to keep the existing stuff including the !irqdomain parts
sufficiently self contained so I can actually change the inner workings
of msi domains without going back to any of these places (hopefully).
  
>>   5) Implement an IMS user.
>> 
>>      The obvious candidate which should be halfways accessible is the
>>      ath11 PCI driver which falls into that category.
>
> Aiiee:

Yes.

> drivers/net/wireless/ath/ath11k/pci.c:  ab_pci->msi_ep_base_data = msi_desc->msg.data;

That's only one part of it. Look how the address is retrieved.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
