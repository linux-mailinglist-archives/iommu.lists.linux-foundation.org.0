Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7647007A
	for <lists.iommu@lfdr.de>; Fri, 10 Dec 2021 13:13:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 010424250C;
	Fri, 10 Dec 2021 12:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k94LLhizW4HI; Fri, 10 Dec 2021 12:13:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DA14C42542;
	Fri, 10 Dec 2021 12:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19789C0038;
	Fri, 10 Dec 2021 12:13:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26726C0012
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 12:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A48C41195
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 12:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="oe+ng6LU";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="o4xXuI8J"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NS-FQ0_fUooZ for <iommu@lists.linux-foundation.org>;
 Fri, 10 Dec 2021 12:13:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EEDE41191
 for <iommu@lists.linux-foundation.org>; Fri, 10 Dec 2021 12:13:22 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639138399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QIJx3V1nvr+fY8tSaxth/62MySjeKbxzIzd3EtwZXi4=;
 b=oe+ng6LUlIuJbSWH+D4G64HgHQTE7jlH1UxjiFAklZOgQndHfatMqyxA+ClH9kcFJzMYy2
 O1DDAhtiq7b/uciVymud2fZkbwZ62ykl6W57llLL484YhV/xZ1hRQpdSrEsGEylvECuASS
 9DjNK8XZGMvc9zwoSrnr53iAApm5+PXPowdNv51cxz/dXUw5DY4XiFE6h8jvcVN5ZITl7a
 U8lc6wFlmoASIk3dQCbf1XQ6XeJ2/A5soMV1eoKHwX0V0Hys54zonoDOqtxe3AjZLG54Ac
 EwR17FYlTjNgKM0Z3OI7yd105AZ+gBfWeABDPaTCtBzrph4+6vz+H2Tj4ZP9ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639138399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QIJx3V1nvr+fY8tSaxth/62MySjeKbxzIzd3EtwZXi4=;
 b=o4xXuI8J+9OC404Thd08WZ3NU1jI+FqeWY93Iczbh6a01mb1Oeluyrbr3nFh3pAzPdQRcg
 +pLv7bujunlyGOAQ==
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
In-Reply-To: <BN9PR11MB527619B099061B3814EB40408C719@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <8c2262ba-173e-0007-bc4c-94ec54b2847d@intel.com>
 <87pmqg88xq.ffs@tglx> <df00b87e-00dc-d998-8b64-46b16dba46eb@intel.com>
 <87k0go8432.ffs@tglx> <f4cc305b-a329-6d27-9fca-b74ebc9fa0c1@intel.com>
 <878rx480fk.ffs@tglx>
 <BN9PR11MB52765F2EF8420C60FD5945D18C709@BN9PR11MB5276.namprd11.prod.outlook.com>
 <87sfv2yy19.ffs@tglx> <20211209162129.GS6385@nvidia.com>
 <878rwtzfh1.ffs@tglx> <20211209205835.GZ6385@nvidia.com>
 <8735n1zaz3.ffs@tglx> <87sfv1xq3b.ffs@tglx>
 <BN9PR11MB527619B099061B3814EB40408C719@BN9PR11MB5276.namprd11.prod.outlook.com>
Date: Fri, 10 Dec 2021 13:13:18 +0100
Message-ID: <87lf0sy7xd.ffs@tglx>
MIME-Version: 1.0
Cc: Allen Hubbe <allenbh@gmail.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Zygnier <maz@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
 Logan Gunthorpe <logang@deltatee.com>, "Dey, Megha" <megha.dey@intel.com>
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

Kevin,

On Fri, Dec 10 2021 at 07:29, Kevin Tian wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>>   4) For the guest side we agreed that we need an hypercall because the
>>      host can't trap the write to the MSI[-X] entry anymore.
>
> To be accurate I'd like to not call it "can't trap". The host still traps the 
> MSI/MSI-X entry if the hypercall is not used. This is for current guest 
> OS which doesn't have this hypercall mechanism. For future new guest
> OS which will support this machinery then a handshake process from
> such guest will disable the trap for MSI-X and map it for direct guest
> access in the fly.

Right. What I'm suggesting is a clear cut between the current approach,
which obviously needs to be preserved, and a consistent new approach
which handles MSI, MSI-X and IMS in the exactly same way.

> MSI has to be always trapped although the guest has acquired the right 
> data/addr pair via the hypercall, since it's a PCI config capability.
>
>> 
>>      Aside of the fact that this creates a special case for IMS which is
>>      undesirable in my opinion, it's not really obvious where the
>>      hypercall should be placed to work for all scenarios so that it can
>>      also solve the existing issue of silent failures.
>> 
>>   5) It's not possible for the kernel to reliably detect whether it is
>>      running on bare metal or not. Yes we talked about heuristics, but
>>      that's something I really want to avoid.
>
> How would the hypercall mechanism avoid such heuristics?

The availability of IR remapping where the irqdomain which is provided
by the remapping unit signals that it supports this new scheme:

                    |--IO/APIC
                    |--MSI
     vector -- IR --|--MSI-X
                    |--IMS

while the current scheme is:

                    |--IO/APIC
     vector -- IR --|--PCI/MSI[-X]

or 

                    |--IO/APIC
     vector --------|--PCI/MSI[-X]

So in the new scheme the IR domain will advertise new features which are
not available on older kernels. The availability of these new features
is the indicator for the interrupt subsystem and subsequently for PCI
whether IMS is supported or not.

Bootup either finds an IR unit or not. In the bare metal case that's the
usual hardware/firmware detection. In the guest case it's the
availability of vIR including the required hypercall protocol.

So for the guest case the initialization would look like this:

   qemu starts guest
      Method of interrupt management defaults to current scheme
      restricted to MSI/MSI-X

      guest initializes
          older guest do not check for the hypercall so everything
          continues as of today

          new guest initializes vIR, detects hypercall and requests
          from the hypervisor to switch over to the new scheme.

          The hypervisor grants or rejects the request, i.e. either both
          switch to the new scheme or stay with the old one.

The new scheme means, that all variants, MSI, MSI-X, IMS are handled in
the same way. Staying on the old scheme means that IMS is not available
to the guest.

Having that clear separation is in my opinion way better than trying to
make all of that a big maze of conditionals.

I'm going to make that clear cut in the PCI/MSI management layer as
well. Trying to do that hybrid we do today for irqdomain and non
irqdomain based backends is just not feasible. The decision which way to
go will be very close to the driver exposed API, i.e.:

   pci_alloc_ims_vector()
        if (new_scheme())
        	return new_scheme_alloc_ims();
        else
        	return -ENOTSUPP;

and new_scheme_alloc_ims() will have:

   new_scheme_alloc_ims()
        if (!system_supports_ims())
        	return -ENOTSUPP;
        ....

system_supports_ims() makes its decision based on the feature flags
exposed by the underlying base MSI irqdomain, i.e. either vector or IR
on x86.

Vector domain will not have that feature flag set, but IR will have on
bare metal and eventually in the guest when the vIR setup and hypercall
detection and negotiation succeeds.

> Then Qemu needs to find out the GSI number for the vIRTE handle. 
> Again Qemu doesn't have such information since it doesn't know 
> which MSI[-X] entry points to this handle due to no trap.
>
> This implies that we may also need carry device ID, #msi entry, etc. 
> in the hypercall, so Qemu can associate the virtual routing info
> to the right [irqfd, gsi].
>
> In your model the hypercall is raised by IR domain. Do you see
> any problem of finding those information within IR domain?

IR has the following information available:

   Interrupt type
    - MSI:   Device, index and number of vectors
    - MSI-X: Device, index
    - IMS:   Device, index

  Target APIC/vector pair

IMS: The index depends on the storage type:

     For storage in device memory, e.g. IDXD, it's the array index.

     For storage in system memory, the index is a software artifact.

Does that answer your question?

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
