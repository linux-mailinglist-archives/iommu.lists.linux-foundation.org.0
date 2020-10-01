Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA628004D
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 15:39:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 50D1E86A56;
	Thu,  1 Oct 2020 13:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFU7PIt42OrZ; Thu,  1 Oct 2020 13:39:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDBF786A2F;
	Thu,  1 Oct 2020 13:39:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0FC7C0051;
	Thu,  1 Oct 2020 13:39:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8424C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 13:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C6C3886A3C
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 13:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jjop3Ah3bcjW for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 13:39:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3B1B684540
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 13:39:46 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f75dbba0004>; Thu, 01 Oct 2020 06:38:02 -0700
Received: from [10.2.161.39] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 13:39:44 +0000
From: Zi Yan <ziy@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Boot crash due to "x86/msi: Consolidate MSI allocation"
Date: Thu, 1 Oct 2020 09:39:42 -0400
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <2F4EC354-C0BB-44BD-86A5-07F321590C31@nvidia.com>
In-Reply-To: <874knegxtg.fsf@nanos.tec.linutronix.de>
References: <A838FF2B-11FC-42B9-87D7-A76CF46E0575@nvidia.com>
 <874knegxtg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601559483; bh=sFTfs2wKiAAdF9G/OK6dAZg/42/8CaV6qHMuyOsZ5z8=;
 h=From:To:CC:Subject:Date:X-Mailer:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:X-Originating-IP:
 X-ClientProxiedBy;
 b=TPHGplKHkL8cUhcoay8Vx9C6+fu8GLE1UKqjQd6vyy68K1+6s48tbdNX4Ixo22ipS
 WefYfhwsODoZoqNxCtcVZ/XS1m+h9X/xjtquPVVQpptUXb5Hh1mzGojUag9Ifrx2yM
 CcLqu3+MWgws6V6CjhPPn9ZJhyfDmDIhYBRrnrapdfldkQiq9WH8eIbRbSJmK5xNor
 dl5stqBjUQfaHYUUSwlKTrVBRA5DwcHGVYv6iRlep5m8731W9A02mP3EqZsNIGJd5a
 lxBXeGTgYkTuEwRr9JMV6JIWe8/nGcC1wKDVdvQdQPL4dPrwKWpG9kAjTtUV3dZyor
 FntxzCcwEWz+Q==
Cc: Wei Liu <wei.liu@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 linux-pci@vger.kernel.org, x86@kernel.org, linux-hyperv@vger.kernel.org,
 iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org
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
Content-Type: multipart/mixed; boundary="===============5493738435889573525=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

--===============5493738435889573525==
Content-Type: multipart/signed;
	boundary="=_MailMate_E37D7855-5714-45DB-89F0-E1847DF19DAF_=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=_MailMate_E37D7855-5714-45DB-89F0-E1847DF19DAF_=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 1 Oct 2020, at 4:22, Thomas Gleixner wrote:

> Yan,
>
> On Wed, Sep 30 2020 at 21:29, Zi Yan wrote:
>> I am running linux-next on my Dell R630 and the system crashed at boot=

>> time. I bisected linux-next and got to your commit:
>>
>>     x86/msi: Consolidate MSI allocation
>>
>> The crash log is below and my .config is attached.
>>
>> [   11.840905]  intel_get_irq_domain+0x24/0xb0
>> [   11.840905]  native_setup_msi_irqs+0x3b/0x90
>
> This is not really helpful because that's in the middle of the queue an=
d
> that code is gone at the very end. Yes, it's unfortunate that this
> breaks bisection.
>
> Can you please test:
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/irq
>
> which contains fixes and if it still crashes provide the dmesg of it.
>

My system boots without any problem using this tree. Thanks.

=E2=80=94
Best Regards,
Yan Zi

--=_MailMate_E37D7855-5714-45DB-89F0-E1847DF19DAF_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl913B4PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKh4EP+wa4YAP+3OSFbCe0zBYGBxknODe/+Ns2BfM/
VWWcPZpcXCkaGo+f8EeYWM8tSgeYE42mDsJcG69uCRmKMJLM352iud3Kz1JRZm2Q
vxl1pWEvmvbiYmoAYbzp8B9564jX0uWJy9zKOzXkuh/jmD2m58zviAK9adapw5b0
PvVuTaa+FYYHVYxitrag3xgZsEXqK7bgJq3fCGTZ7+lRGrmM9atX616B6Dn/xx4F
/qamJ3Ema0UE45AbrrIJ076P9RJEzaTmD6SzdDfJ0Ygc2quCjskTnm1pq+MSC9fc
5Tm8IH+O+vGPeIXwZGMIj3hYWG93yDusIHPbLgTKxj1n6ygsvtEUteBB1tQ7jtKB
dK/u/L37LOZsBwhmjN2vNjpxyawj8SmwbSOcsPhGRDNY+9vO5ZAyF0NL/42urRHD
RP+m3xqp3PJOWZASZe6RNi7y1C92d9HbCHVZnc0zOz6/Ko2VtWImx9mDmsQEqD/N
cq7tq04HF9FOGeVgrmfviH+68K/FdmZct454G2y4k7eJ3Nth6MzSVopV8PWzzqrP
Jx+WQen0XUW7f1z+mf7ZmmjWpyooywgzCBHMSEoRCsA1TRgMN1pFaAfrX4LorzON
Bl1HnvJTZH4yxyOAb1L+a+aIrqKJmwMIWT1Gm8e0FGSKuH6wPyE/CrQdXvQkbmub
3YTfhW6e
=3Jrz
-----END PGP SIGNATURE-----

--=_MailMate_E37D7855-5714-45DB-89F0-E1847DF19DAF_=--

--===============5493738435889573525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============5493738435889573525==--
