Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE2298114
	for <lists.iommu@lfdr.de>; Sun, 25 Oct 2020 10:49:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E26788751D;
	Sun, 25 Oct 2020 09:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhxKETS5NS9v; Sun, 25 Oct 2020 09:49:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D3868753D;
	Sun, 25 Oct 2020 09:49:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84086C0859;
	Sun, 25 Oct 2020 09:49:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C00EAC0859
 for <iommu@lists.linux-foundation.org>; Sun, 25 Oct 2020 09:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A41DB2011A
 for <iommu@lists.linux-foundation.org>; Sun, 25 Oct 2020 09:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGns5J0TK3F9 for <iommu@lists.linux-foundation.org>;
 Sun, 25 Oct 2020 09:49:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by silver.osuosl.org (Postfix) with ESMTPS id C86B927400
 for <iommu@lists.linux-foundation.org>; Sun, 25 Oct 2020 09:49:08 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-79-APpQa5EwNZOHyfX3wdwU4Q-1; Sun, 25 Oct 2020 09:49:04 +0000
X-MC-Unique: APpQa5EwNZOHyfX3wdwU4Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sun, 25 Oct 2020 09:49:03 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Sun, 25 Oct 2020 09:49:03 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'David Woodhouse' <dwmw2@infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH v3 17/35] x86/pci/xen: Use msi_msg shadow structs
Thread-Topic: [PATCH v3 17/35] x86/pci/xen: Use msi_msg shadow structs
Thread-Index: AQHWqk3aux8nicxw2kqi6TJIJCakiamoEtJw
Date: Sun, 25 Oct 2020 09:49:03 +0000
Message-ID: <3e69326016524d97bcdea35d0765cc68@AcuMS.aculab.com>
References: <e6601ff691afb3266e365a91e8b221179daf22c2.camel@infradead.org>
 <20201024213535.443185-1-dwmw2@infradead.org>
 <20201024213535.443185-18-dwmw2@infradead.org>
In-Reply-To: <20201024213535.443185-18-dwmw2@infradead.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 kvm <kvm@vger.kernel.org>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "maz@misterjones.org" <maz@misterjones.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
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

From: David Woodhouse
> Sent: 24 October 2020 22:35
> 
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Use the msi_msg shadow structs and compose the message with named bitfields
> instead of the unreadable macro maze.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/pci/xen.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index c552cd2d0632..3d41a09c2c14 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -152,7 +152,6 @@ static int acpi_register_gsi_xen(struct device *dev, u32 gsi,
> 
>  #if defined(CONFIG_PCI_MSI)
>  #include <linux/msi.h>
> -#include <asm/msidef.h>
> 
>  struct xen_pci_frontend_ops *xen_pci_frontend;
>  EXPORT_SYMBOL_GPL(xen_pci_frontend);
> @@ -210,23 +209,20 @@ static int xen_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>  	return ret;
>  }
> 
> -#define XEN_PIRQ_MSI_DATA  (MSI_DATA_TRIGGER_EDGE | \
> -		MSI_DATA_LEVEL_ASSERT | (3 << 8) | MSI_DATA_VECTOR(0))
> -
>  static void xen_msi_compose_msg(struct pci_dev *pdev, unsigned int pirq,
>  		struct msi_msg *msg)
>  {
> -	/* We set vector == 0 to tell the hypervisor we don't care about it,
> -	 * but we want a pirq setup instead.
> -	 * We use the dest_id field to pass the pirq that we want. */
> -	msg->address_hi = MSI_ADDR_BASE_HI | MSI_ADDR_EXT_DEST_ID(pirq);
> -	msg->address_lo =
> -		MSI_ADDR_BASE_LO |
> -		MSI_ADDR_DEST_MODE_PHYSICAL |
> -		MSI_ADDR_REDIRECTION_CPU |
> -		MSI_ADDR_DEST_ID(pirq);
> -
> -	msg->data = XEN_PIRQ_MSI_DATA;
> +	/*
> +	 * We set vector == 0 to tell the hypervisor we don't care about
> +	 * it, but we want a pirq setup instead.  We use the dest_id fields
> +	 * to pass the pirq that we want.
> +	 */
> +	memset(msg, 0, sizeof(*msg));
> +	msg->address_hi = X86_MSI_BASE_ADDRESS_HIGH;
> +	msg->arch_addr_hi.destid_8_31 = pirq >> 8;
> +	msg->arch_addr_lo.destid_0_7 = pirq & 0xFF;
> +	msg->arch_addr_lo.base_address = X86_MSI_BASE_ADDRESS_LOW;
> +	msg->arch_data.delivery_mode = APIC_DELIVERY_MODE_EXTINT;
>  }

Just looking at a random one of these patches...

Does the compiler manage to optimise that reasonably?
Or does it generate a lot of shifts and masks as each
bitfield is set?

The code generation for bitfields is often a lot worse
that that for |= setting bits in a word.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
