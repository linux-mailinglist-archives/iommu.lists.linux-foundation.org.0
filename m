Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7043BC94B
	for <lists.iommu@lfdr.de>; Tue,  6 Jul 2021 12:15:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885DB6083A;
	Tue,  6 Jul 2021 10:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLz1wYet6ZJ5; Tue,  6 Jul 2021 10:15:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7BB1D6083F;
	Tue,  6 Jul 2021 10:15:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5445CC000E;
	Tue,  6 Jul 2021 10:15:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7803C000E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 10:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA10482792
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 10:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6JsS56fP2MK for <iommu@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 10:15:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DCE482771
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625566502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EbtKyQLHeXyAf7XTeEVWB1Q3nM607AfNrt9n7XkxYzw=;
 b=LnrxZknS5z6ZvGq4UBhhvPzlWnZrbpIGIVSE7WhefxX7iX8SPhiyC0QO8ENGSR2ROAkqL8
 PozpkywowT4Tlu9PfZ/o0WUMC5Uh90TyGXBzft26n/fTaw6vL2Nfkcy00s6ZdgaBt2LQUI
 OaVRu6BeRN76s2sFNkj7g6YATHVPfC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-McPLJZCxOI-QDg_bHt4FDw-1; Tue, 06 Jul 2021 06:15:00 -0400
X-MC-Unique: McPLJZCxOI-QDg_bHt4FDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECA2F9126B;
 Tue,  6 Jul 2021 10:14:56 +0000 (UTC)
Received: from localhost (ovpn-115-23.ams2.redhat.com [10.36.115.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F76610074F8;
 Tue,  6 Jul 2021 10:14:51 +0000 (UTC)
Date: Tue, 6 Jul 2021 11:14:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v8 10/10] Documentation: Add documentation for VDUSE
Message-ID: <YOQtG3gDOhHDO5CQ@stefanha-x1.localdomain>
References: <20210615141331.407-11-xieyongji@bytedance.com>
 <YNSCH6l31zwPxBjL@stefanha-x1.localdomain>
 <CACycT3uxnQmXWsgmNVxQtiRhz1UXXTAJFY3OiAJqokbJH6ifMA@mail.gmail.com>
 <YNxCDpM3bO5cPjqi@stefanha-x1.localdomain>
 <CACycT3taKhf1cWp3Jd0aSVekAZvpbR-_fkyPLQ=B+jZBB5H=8Q@mail.gmail.com>
 <YN3ABqCMLQf7ejOm@stefanha-x1.localdomain>
 <CACycT3vo-diHgTSLw_FS2E+5ia5VjihE3qw7JmZR7JT55P-wQA@mail.gmail.com>
 <8320d26d-6637-85c6-8773-49553dfa502d@redhat.com>
 <YOL/9mxkJaokKDHc@stefanha-x1.localdomain>
 <5b5107fa-3b32-8a3b-720d-eee6b2a84ace@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5b5107fa-3b32-8a3b-720d-eee6b2a84ace@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Yongji Xie <xieyongji@bytedance.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 songmuchun@bytedance.com, Jens Axboe <axboe@kernel.dk>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mika.penttila@nextfour.com>
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
Content-Type: multipart/mixed; boundary="===============6771731728710576684=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============6771731728710576684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bGDTE9bI8S9vsB/T"
Content-Disposition: inline


--bGDTE9bI8S9vsB/T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 10:34:33AM +0800, Jason Wang wrote:
>=20
> =E5=9C=A8 2021/7/5 =E4=B8=8B=E5=8D=888:49, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Mon, Jul 05, 2021 at 11:36:15AM +0800, Jason Wang wrote:
> > > =E5=9C=A8 2021/7/4 =E4=B8=8B=E5=8D=885:49, Yongji Xie =E5=86=99=E9=81=
=93:
> > > > > > OK, I get you now. Since the VIRTIO specification says "Device
> > > > > > configuration space is generally used for rarely-changing or
> > > > > > initialization-time parameters". I assume the VDUSE_DEV_SET_CON=
FIG
> > > > > > ioctl should not be called frequently.
> > > > > The spec uses MUST and other terms to define the precise requirem=
ents.
> > > > > Here the language (especially the word "generally") is weaker and=
 means
> > > > > there may be exceptions.
> > > > >=20
> > > > > Another type of access that doesn't work with the VDUSE_DEV_SET_C=
ONFIG
> > > > > approach is reads that have side-effects. For example, imagine a =
field
> > > > > containing an error code if the device encounters a problem unrel=
ated to
> > > > > a specific virtqueue request. Reading from this field resets the =
error
> > > > > code to 0, saving the driver an extra configuration space write a=
ccess
> > > > > and possibly race conditions. It isn't possible to implement those
> > > > > semantics suing VDUSE_DEV_SET_CONFIG. It's another corner case, b=
ut it
> > > > > makes me think that the interface does not allow full VIRTIO sema=
ntics.
> > >=20
> > > Note that though you're correct, my understanding is that config spac=
e is
> > > not suitable for this kind of error propagating. And it would be very=
 hard
> > > to implement such kind of semantic in some transports.=C2=A0 Virtqueu=
e should be
> > > much better. As Yong Ji quoted, the config space is used for
> > > "rarely-changing or intialization-time parameters".
> > >=20
> > >=20
> > > > Agreed. I will use VDUSE_DEV_GET_CONFIG in the next version. And to
> > > > handle the message failure, I'm going to add a return value to
> > > > virtio_config_ops.get() and virtio_cread_* API so that the error can
> > > > be propagated to the virtio device driver. Then the virtio-blk devi=
ce
> > > > driver can be modified to handle that.
> > > >=20
> > > > Jason and Stefan, what do you think of this way?
> > Why does VDUSE_DEV_GET_CONFIG need to support an error return value?
> >=20
> > The VIRTIO spec provides no way for the device to report errors from
> > config space accesses.
> >=20
> > The QEMU virtio-pci implementation returns -1 from invalid
> > virtio_config_read*() and silently discards virtio_config_write*()
> > accesses.
> >=20
> > VDUSE can take the same approach with
> > VDUSE_DEV_GET_CONFIG/VDUSE_DEV_SET_CONFIG.
> >=20
> > > I'd like to stick to the current assumption thich get_config won't fa=
il.
> > > That is to say,
> > >=20
> > > 1) maintain a config in the kernel, make sure the config space read c=
an
> > > always succeed
> > > 2) introduce an ioctl for the vduse usersapce to update the config sp=
ace.
> > > 3) we can synchronize with the vduse userspace during set_config
> > >=20
> > > Does this work?
> > I noticed that caching is also allowed by the vhost-user protocol
> > messages (QEMU's docs/interop/vhost-user.rst), but the device doesn't
> > know whether or not caching is in effect. The interface you outlined
> > above requires caching.
> >=20
> > Is there a reason why the host kernel vDPA code needs to cache the
> > configuration space?
>=20
>=20
> Because:
>=20
> 1) Kernel can not wait forever in get_config(), this is the major differe=
nce
> with vhost-user.

virtio_cread() can sleep:

  #define virtio_cread(vdev, structname, member, ptr)                     \
          do {                                                            \
                  typeof(((structname*)0)->member) virtio_cread_v;        \
                                                                          \
                  might_sleep();                                          \
                  ^^^^^^^^^^^^^^

Which code path cannot sleep?

> 2) Stick to the current assumption that virtio_cread() should always
> succeed.

That can be done by reading -1 (like QEMU does) when the read fails.

Stefan

--bGDTE9bI8S9vsB/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDkLRoACgkQnKSrs4Gr
c8g5rQf/dEn1vwdw9gb5jvAShRGnaCqMAiYL94qRkH44VSSYFNUpuWuei42cVzk5
PXleyCcoPY4o1g1xBwL6ddvi0qziAyjlTDw4BkflDiLyDqRk4cryoGSdxBe9mNoq
mOiwWONGbv2EHefjW2PLq5MpuVf2XYEJlSyIpJPSfEpaClH8tF16GhcHofMePvnS
d4etvc/M6x7ZiX8mV+lTVK/+5VRYPpcBTmLLkHObS0Dk4utsosMBRj0n+26ZsLCu
O7Hifgw0DrW0IQCYB5GNnKNYYPdeSNvXv7I6mqaI9W/xLPsP5Ze2IPDITeMmAtWS
ppMaw40ExhBaIt4ViPFG//Va5Me2rQ==
=TOAU
-----END PGP SIGNATURE-----

--bGDTE9bI8S9vsB/T--


--===============6771731728710576684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============6771731728710576684==--

