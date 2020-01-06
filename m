Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C2131573
	for <lists.iommu@lfdr.de>; Mon,  6 Jan 2020 16:52:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9CE3A8625D;
	Mon,  6 Jan 2020 15:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uI1PA-6jDB40; Mon,  6 Jan 2020 15:52:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5183F8625E;
	Mon,  6 Jan 2020 15:52:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40789C1D8B;
	Mon,  6 Jan 2020 15:52:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73571C0881
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 15:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 61F092049A
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 15:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1nLNGin6P6N for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 15:49:48 +0000 (UTC)
X-Greylist: delayed 00:06:41 by SQLgrey-1.7.6
Received: from mail.tty42.de (mail.tty42.de [94.130.190.181])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C2032269B
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 15:49:47 +0000 (UTC)
Received: from [192.168.113.179] (exchange.betterbits.de [153.92.184.26])
 by mail.tty42.de (OpenSMTPD) with ESMTPSA id fabeb5a8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO); 
 Mon, 6 Jan 2020 15:43:05 +0000 (UTC)
To: iommu@lists.linux-foundation.org
From: Frederik Schwan <frederik.schwan@linux.com>
Subject: Regression iommu/vt-d bounce buffer
Autocrypt: addr=frederik.schwan@linux.com; prefer-encrypt=mutual; keydata=
 mDMEW9oydRYJKwYBBAHaRw8BAQdAwTbkw/DmyNaVgSgjBIm3H/wPx33LSjbzEGXObn0oIP+0
 K0ZyZWRlcmlrIFNjaHdhbiA8ZnJlZGVyaWsuc2Nod2FuQGxpbnV4LmNvbT6IlwQTFgoAPwIb
 IwUJA8UKAAULCQgHCgQVCgkIBBYDAgECHgECF4AWIQQFx3danouXdAf+COadTFqhVCbaCgUC
 W9xwKwIZAQAKCRCdTFqhVCbaCq3eAQCjIkYRO+cUBcSuV+oJEnCcaSvkv7haXAzvwsqOYXlK
 uwEAmS41sEzVEgb8iI4uav9/dUFX9emGIJuGUkWpkGLEkwK4OARb2jKvEgorBgEEAZdVAQUB
 AQdAJ9JKhH3U1tUrRZaYiFmrctZbTyU3x7WFAcPjbD1IzCMDAQgHiH4EGBYKACYWIQQFx3da
 nouXdAf+COadTFqhVCbaCgUCW9oyrwIbDAUJA8UKAAAKCRCdTFqhVCbaCsMzAQDKP8i6spzB
 4ACYhyJK38HmOQKFE/mWFJ8UIed6ZtvtOwD/XTUcQcGDJDCo0jOBJfBgN99GNFzwb6xlnsoX
 549uGgA=
Message-ID: <fe41dfaa-e899-0d6c-69e4-0379be376c09@linux.com>
Date: Mon, 6 Jan 2020 16:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jan 2020 15:52:37 +0000
Cc: David Woodhouse <dwmw2@infradead.org>
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
Content-Type: multipart/mixed; boundary="===============0043529482702206366=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0043529482702206366==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="dj3AdfOmkL8bze4x0YHtzRDsB4ayoXaCc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dj3AdfOmkL8bze4x0YHtzRDsB4ayoXaCc
Content-Type: multipart/mixed; boundary="57w1xiRtG9te2j7zo4RPi1fNOA2CJNIdc";
 protected-headers="v1"
From: Frederik Schwan <frederik.schwan@linux.com>
To: iommu@lists.linux-foundation.org
Cc: David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, joro@8bytes.org
Message-ID: <fe41dfaa-e899-0d6c-69e4-0379be376c09@linux.com>
Subject: Regression iommu/vt-d bounce buffer

--57w1xiRtG9te2j7zo4RPi1fNOA2CJNIdc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello people,
since the introduction of the bounce buffer, a regression with TB3 device=
s has been introduced.
USB devices attached to TB3 refuse to work since. Removing the commits th=
at introduced the bounce buffer, fixes the issue.

Commits:
3b53034c268d550d9e8522e613a14ab53b8840d8
c5a5dc4cbbf4540c1891cdb2b70cf469405ea61f
cfb94a372f2d4ee226247447c863f8709863d170
e5e04d051979dbd636a99099b7a595093c50a4bc


An excerpt of the trace:
> [  +0,000005] WARNING: CPU: 10 PID: 0 at drivers/iommu/intel-iommu.c:39=
16 bounce_unmap_single+0x103/0x110
> [...]
> [  +0,000001] Call Trace:
> [  +0,000002]  <IRQ>
> [  +0,000003]  usb_hcd_unmap_urb_setup_for_dma+0x9f/0xe0
> [  +0,000001]  usb_hcd_unmap_urb_for_dma+0x1c/0x170
> [  +0,000002]  __usb_hcd_giveback_urb+0x36/0x120
> [  +0,000008]  xhci_giveback_urb_in_irq.isra.0+0x72/0x100 [xhci_hcd]
> [  +0,000007]  xhci_td_cleanup+0x101/0x140 [xhci_hcd]
> [  +0,000007]  xhci_irq+0xbf0/0x1db0 [xhci_hcd]
> [  +0,000005]  __handle_irq_event_percpu+0x44/0x1b0
> [  +0,000002]  handle_irq_event_percpu+0x34/0x80
> [  +0,000002]  handle_irq_event+0x37/0x54
> [  +0,000002]  handle_edge_irq+0xae/0x1f0
> [  +0,000002]  do_IRQ+0x84/0x140
> [  +0,000003]  common_interrupt+0xf/0xf
> [  +0,000001]  </IRQ>

Dmesg log and further information have been posted here: https://bugzilla=
=2Ekernel.org/show_bug.cgi?id=3D205893

Cheers,
Frederik


--57w1xiRtG9te2j7zo4RPi1fNOA2CJNIdc--

--dj3AdfOmkL8bze4x0YHtzRDsB4ayoXaCc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iNUEARYKAH0WIQQFx3danouXdAf+COadTFqhVCbaCgUCXhNViV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MDVD
Nzc3NUE5RThCOTc3NDA3RkUwOEU2OUQ0QzVBQTE1NDI2REEwQQAKCRCdTFqhVCba
Chb/AQD12+Kl7/BiOaZUVRt4j+cO1DYKXvWdR841BQEljNgpUgEA71tKher7vlGW
wAXRyWIS8co2E5mHNdDzfq4qDVm6ugs=
=osMq
-----END PGP SIGNATURE-----

--dj3AdfOmkL8bze4x0YHtzRDsB4ayoXaCc--

--===============0043529482702206366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0043529482702206366==--
