Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F741D1B3
	for <lists.iommu@lfdr.de>; Thu, 30 Sep 2021 05:02:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA43984099;
	Thu, 30 Sep 2021 03:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWUrGUdQAKpm; Thu, 30 Sep 2021 03:02:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC0B084092;
	Thu, 30 Sep 2021 03:02:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 774CBC000D;
	Thu, 30 Sep 2021 03:02:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D640EC000D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 03:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABCCB42553
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 03:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XVn2f-sCPFVj for <iommu@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 03:02:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA42E42546
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 03:02:51 +0000 (UTC)
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKdMn56h9z4xbL; Thu, 30 Sep 2021 13:02:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632970965;
 bh=2chqBsylnpGWmu4/Ed3eGkp8ajdFLitawmHgzQaDmXw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A4cfx1VeFIsTqJ1k4Q6E8pZP0Hfou7CmoniTfjOaeN1WkMvgKiG8Vw28t86iAyGSh
 N7PAncCR5TeJOCgm6Q07ayfhhXlfSLz4baebq0BiVDlF5nS2SLDRyOO6qFAIj8SIJX
 tGP84lGIl13L4sz2ILlRGWUZErmjSbvgGaN6oY6w=
Date: Thu, 30 Sep 2021 12:43:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC 02/20] vfio: Add device class for /dev/vfio/devices
Message-ID: <YVUkYu59TJn5tcFg@yekko>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-3-yi.l.liu@intel.com>
 <YVPKu/F3IpPMtGCh@yekko>
 <20210929130521.738c56ed.alex.williamson@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929130521.738c56ed.alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 jean-philippe@linaro.org, dave.jiang@intel.com, ashok.raj@intel.com,
 corbet@lwn.net, jgg@nvidia.com, kevin.tian@intel.com, parav@mellanox.com,
 lkml@metux.net, dwmw2@infradead.org, jun.j.tian@intel.com,
 linux-kernel@vger.kernel.org, lushenming@huawei.com,
 iommu@lists.linux-foundation.org, pbonzini@redhat.com, robin.murphy@arm.com
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
Content-Type: multipart/mixed; boundary="===============6182139600451541980=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============6182139600451541980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BWB8IX6FMezkTNqc"
Content-Disposition: inline


--BWB8IX6FMezkTNqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 01:05:21PM -0600, Alex Williamson wrote:
> On Wed, 29 Sep 2021 12:08:59 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Sun, Sep 19, 2021 at 02:38:30PM +0800, Liu Yi L wrote:
> > > This patch introduces a new interface (/dev/vfio/devices/$DEVICE) for
> > > userspace to directly open a vfio device w/o relying on container/gro=
up
> > > (/dev/vfio/$GROUP). Anything related to group is now hidden behind
> > > iommufd (more specifically in iommu core by this RFC) in a device-cen=
tric
> > > manner.
> > >=20
> > > In case a device is exposed in both legacy and new interfaces (see ne=
xt
> > > patch for how to decide it), this patch also ensures that when the de=
vice
> > > is already opened via one interface then the other one must be blocke=
d.
> > >=20
> > > Signed-off-by: Liu Yi L <yi.l.liu@intel.com> =20
> > [snip]
> >=20
> > > +static bool vfio_device_in_container(struct vfio_device *device)
> > > +{
> > > +	return !!(device->group && device->group->container); =20
> >=20
> > You don't need !! here.  && is already a logical operation, so returns
> > a valid bool.
> >=20
> > > +}
> > > +
> > >  static int vfio_device_fops_release(struct inode *inode, struct file=
 *filep)
> > >  {
> > >  	struct vfio_device *device =3D filep->private_data;
> > > @@ -1560,7 +1691,16 @@ static int vfio_device_fops_release(struct ino=
de *inode, struct file *filep)
> > > =20
> > >  	module_put(device->dev->driver->owner);
> > > =20
> > > -	vfio_group_try_dissolve_container(device->group);
> > > +	if (vfio_device_in_container(device)) {
> > > +		vfio_group_try_dissolve_container(device->group);
> > > +	} else {
> > > +		atomic_dec(&device->opened);
> > > +		if (device->group) {
> > > +			mutex_lock(&device->group->opened_lock);
> > > +			device->group->opened--;
> > > +			mutex_unlock(&device->group->opened_lock);
> > > +		}
> > > +	}
> > > =20
> > >  	vfio_device_put(device);
> > > =20
> > > @@ -1613,6 +1753,7 @@ static int vfio_device_fops_mmap(struct file *f=
ilep, struct vm_area_struct *vma)
> > > =20
> > >  static const struct file_operations vfio_device_fops =3D {
> > >  	.owner		=3D THIS_MODULE,
> > > +	.open		=3D vfio_device_fops_open,
> > >  	.release	=3D vfio_device_fops_release,
> > >  	.read		=3D vfio_device_fops_read,
> > >  	.write		=3D vfio_device_fops_write,
> > > @@ -2295,6 +2436,52 @@ static struct miscdevice vfio_dev =3D {
> > >  	.mode =3D S_IRUGO | S_IWUGO,
> > >  };
> > > =20
> > > +static char *vfio_device_devnode(struct device *dev, umode_t *mode)
> > > +{
> > > +	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev)); =20
> >=20
> > Others have pointed out some problems with the use of dev_name()
> > here.  I'll add that I think you'll make things much easier if instead
> > of using one huge "devices" subdir, you use a separate subdir for each
> > vfio sub-driver (so, one for PCI, one for each type of mdev, one for
> > platform, etc.).  That should make avoiding name conflicts a lot simple=
r.
>=20
> It seems like this is unnecessary if we use the vfioX naming approach.
> Conflicts are trivial to ignore if we don't involve dev_name() and
> looking for the correct major:minor chardev in the correct subdirectory
> seems like a hassle for userspace.  Thanks,

Right.. it does sound like a hassle, but AFAICT that's *more*
necessary with /dev/vfio/vfioXX than with /dev/vfio/pci/DDDD:BB:SS.F,
since you have to look up a meaningful name in sysfs to find the right
devnode.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BWB8IX6FMezkTNqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFVJGAACgkQbDjKyiDZ
s5KzhhAApuv/xOzLxLHMyjuwLZM9hndWaHiOABTekrzAPageCyg8VIoWQld0IJZ7
m7jhClwoV3hwiJlg6HmyiRv7RAR6tMDJ3mVmaVXbHtWnRutl+4ZFBVdtuVlN3kYZ
WPVbqDupUviFlyO2+1i42HczlsUi2AFRiz7iEnJ8VBmkk00iYQNww0yRl8aB/vwl
E7c9G0HujmDtL+ob2jleWp2ynLDHCIU6VffkKUnp4irpyjPcWZ0pmnAVFiblP9I+
WdTEYw+HX+N3RWPKs7h+azughTZNJL+W6WGQkorEOvBmIYLgrt0Llf6UxXglw98d
QbtvusTEpn59yGnPuJQoSg8c3wPGuK81MFZQXY34GJwyNNf6j69UZMk82/TmUwav
u7DbHq82cG3Dn1jAlwRJnT4PSGBKU9dYmwh9J9sxCoPyS9nJqCk9tCj2aj5+WQqC
vJ9VP/p4QXwMnlPnXsKEBgDSyzC2WrNiwZ6tIy2TtsPMVaTQQts/3lKrABR5bGiN
2kjHuVbRpMxch0cXDo01Ft+wEhDLDl5zv6P5hhcdSgixX0GGh2M0YHZu/cxy4eS2
rbvrS5/NhtAGprFhdQDWFN5u+m1xE8tytmVCpY/23FBn6jU0nagNvEqx1fSqX4GY
UZQM5BL9nAbEY3hH9h1Y2ioJKMgdKT/XqK10coN5jku6rByU2Rs=
=o0Zb
-----END PGP SIGNATURE-----

--BWB8IX6FMezkTNqc--

--===============6182139600451541980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============6182139600451541980==--
