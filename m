Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE329EF1F
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 16:05:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CEDA86C0C;
	Thu, 29 Oct 2020 15:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hwmir997iMC; Thu, 29 Oct 2020 15:05:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CE9C86BF7;
	Thu, 29 Oct 2020 15:05:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F259C0051;
	Thu, 29 Oct 2020 15:05:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40D8EC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 15:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E25986BE9
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 15:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ev20bF4Jh3fK for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 15:05:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EFE2986BE0
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 15:05:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-56-P6lCnI4YNLSev_eoOtq5HQ-1; Thu, 29 Oct 2020 15:05:32 +0000
X-MC-Unique: P6lCnI4YNLSev_eoOtq5HQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 29 Oct 2020 15:05:31 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 29 Oct 2020 15:05:31 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Thread-Topic: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Thread-Index: AQHWrZenJpzBwTRfbE+Uihb7XQWTqKmurjkg
Date: Thu, 29 Oct 2020 15:05:31 +0000
Message-ID: <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
References: <20201028212417.3715575-1-arnd@kernel.org>
In-Reply-To: <20201028212417.3715575-1-arnd@kernel.org>
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
 Stephen Hemminger <sthemmin@microsoft.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wanpeng Li <wanpengli@tencent.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jim
 Mattson <jmattson@google.com>
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

From: Arnd Bergmann
> Sent: 28 October 2020 21:21
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are hundreds of warnings in a W=2 build about a local
> variable shadowing the global 'apic' definition:
> 
> arch/x86/kvm/lapic.h:149:65: warning: declaration of 'apic' shadows a global declaration [-Wshadow]
> 
> Avoid this by renaming the global 'apic' variable to the more descriptive
> 'x86_system_apic'. It was originally called 'genapic', but both that
> and the current 'apic' seem to be a little overly generic for a global
> variable.
> 
> Fixes: c48f14966cc4 ("KVM: inline kvm_apic_present() and kvm_lapic_enabled()")
> Fixes: c8d46cf06dc2 ("x86: rename 'genapic' to 'apic'")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: rename the global instead of the local variable in the header
...
> diff --git a/arch/x86/hyperv/hv_apic.c b/arch/x86/hyperv/hv_apic.c
> index 284e73661a18..33e2dc78ca11 100644
> --- a/arch/x86/hyperv/hv_apic.c
> +++ b/arch/x86/hyperv/hv_apic.c
> @@ -259,14 +259,14 @@ void __init hv_apic_init(void)
>  		/*
>  		 * Set the IPI entry points.
>  		 */
> -		orig_apic = *apic;
> -
> -		apic->send_IPI = hv_send_ipi;
> -		apic->send_IPI_mask = hv_send_ipi_mask;
> -		apic->send_IPI_mask_allbutself = hv_send_ipi_mask_allbutself;
> -		apic->send_IPI_allbutself = hv_send_ipi_allbutself;
> -		apic->send_IPI_all = hv_send_ipi_all;
> -		apic->send_IPI_self = hv_send_ipi_self;
> +		orig_apic = *x86_system_apic;
> +
> +		x86_system_apic->send_IPI = hv_send_ipi;
> +		x86_system_apic->send_IPI_mask = hv_send_ipi_mask;
> +		x86_system_apic->send_IPI_mask_allbutself = hv_send_ipi_mask_allbutself;
> +		x86_system_apic->send_IPI_allbutself = hv_send_ipi_allbutself;
> +		x86_system_apic->send_IPI_all = hv_send_ipi_all;
> +		x86_system_apic->send_IPI_self = hv_send_ipi_self;
>  	}
> 
>  	if (ms_hyperv.hints & HV_X64_APIC_ACCESS_RECOMMENDED) {
> @@ -285,10 +285,10 @@ void __init hv_apic_init(void)
>  		 */
>  		apic_set_eoi_write(hv_apic_eoi_write);
>  		if (!x2apic_enabled()) {
> -			apic->read      = hv_apic_read;
> -			apic->write     = hv_apic_write;
> -			apic->icr_write = hv_apic_icr_write;
> -			apic->icr_read  = hv_apic_icr_read;
> +			x86_system_apic->read      = hv_apic_read;
> +			x86_system_apic->write     = hv_apic_write;
> +			x86_system_apic->icr_write = hv_apic_icr_write;
> +			x86_system_apic->icr_read  = hv_apic_icr_read;
>  		}

For those two just add:
	struct apic *apic = x86_system_apic;
before all the assignments.
Less churn and much better code.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
