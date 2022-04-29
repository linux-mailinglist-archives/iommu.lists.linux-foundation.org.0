Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C48514295
	for <lists.iommu@lfdr.de>; Fri, 29 Apr 2022 08:44:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D7C641C51;
	Fri, 29 Apr 2022 06:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W5v4jpPGJhMH; Fri, 29 Apr 2022 06:44:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D463141C7D;
	Fri, 29 Apr 2022 06:44:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCF45C0084;
	Fri, 29 Apr 2022 06:44:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55CBCC002D
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 06:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327B340734
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 06:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gibson.dropbear.id.au
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wj9GUS2obkyI for <iommu@lists.linux-foundation.org>;
 Fri, 29 Apr 2022 06:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DDB1408E2
 for <iommu@lists.linux-foundation.org>; Fri, 29 Apr 2022 06:44:18 +0000 (UTC)
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KqNHs6dCPz4ySs; Fri, 29 Apr 2022 16:44:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1651214649;
 bh=vMEJ0/5wf4X3tQtvSFm/Ubk9Drf2bPlOcerS5X8YBAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZuTAY2/uCtbrlN1ttULrI8hZo6pWlBNgxP6AE6dtds4TYMxZ8RBrU4E+VuW9FQJBo
 B16/uk3+Tqfk+0cj8ayV0AXCb5hj0qdD9BPETpjRP5EtgwA1A0HsK58dQds33qohy3
 +tZ0NXW9xSDsDr66LOEl9tjcPMZWTDlTV76mc+nU=
Date: Fri, 29 Apr 2022 16:00:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH RFC 08/12] iommufd: IOCTLs for the io_pagetable
Message-ID: <Ymt+7gOSlXyy4v5e@yekko>
References: <0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <8-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <YkUvzfHM00FEAemt@yekko> <20220331125841.GG2120790@nvidia.com>
 <YmotBkM103HqanoZ@yekko> <20220428142258.GH8364@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20220428142258.GH8364@nvidia.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============3115968282846919397=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============3115968282846919397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5GpsMNu5u4FPgM1n"
Content-Disposition: inline


--5GpsMNu5u4FPgM1n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 11:22:58AM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 28, 2022 at 03:58:30PM +1000, David Gibson wrote:
> > On Thu, Mar 31, 2022 at 09:58:41AM -0300, Jason Gunthorpe wrote:
> > > On Thu, Mar 31, 2022 at 03:36:29PM +1100, David Gibson wrote:
> > >=20
> > > > > +/**
> > > > > + * struct iommu_ioas_iova_ranges - ioctl(IOMMU_IOAS_IOVA_RANGES)
> > > > > + * @size: sizeof(struct iommu_ioas_iova_ranges)
> > > > > + * @ioas_id: IOAS ID to read ranges from
> > > > > + * @out_num_iovas: Output total number of ranges in the IOAS
> > > > > + * @__reserved: Must be 0
> > > > > + * @out_valid_iovas: Array of valid IOVA ranges. The array lengt=
h is the smaller
> > > > > + *                   of out_num_iovas or the length implied by s=
ize.
> > > > > + * @out_valid_iovas.start: First IOVA in the allowed range
> > > > > + * @out_valid_iovas.last: Inclusive last IOVA in the allowed ran=
ge
> > > > > + *
> > > > > + * Query an IOAS for ranges of allowed IOVAs. Operation outside =
these ranges is
> > > > > + * not allowed. out_num_iovas will be set to the total number of=
 iovas
> > > > > + * and the out_valid_iovas[] will be filled in as space permits.
> > > > > + * size should include the allocated flex array.
> > > > > + */
> > > > > +struct iommu_ioas_iova_ranges {
> > > > > +	__u32 size;
> > > > > +	__u32 ioas_id;
> > > > > +	__u32 out_num_iovas;
> > > > > +	__u32 __reserved;
> > > > > +	struct iommu_valid_iovas {
> > > > > +		__aligned_u64 start;
> > > > > +		__aligned_u64 last;
> > > > > +	} out_valid_iovas[];
> > > > > +};
> > > > > +#define IOMMU_IOAS_IOVA_RANGES _IO(IOMMUFD_TYPE, IOMMUFD_CMD_IOA=
S_IOVA_RANGES)
> > > >=20
> > > > Is the information returned by this valid for the lifeime of the IO=
AS,
> > > > or can it change?  If it can change, what events can change it?
> > > >
> > > > If it *can't* change, then how do we have enough information to
> > > > determine this at ALLOC time, since we don't necessarily know which
> > > > (if any) hardware IOMMU will be attached to it.
> > >=20
> > > It is a good point worth documenting. It can change. Particularly
> > > after any device attachment.
> >=20
> > Right.. this is vital and needs to be front and centre in the
> > comments/docs here.  Really, I think an interface that *doesn't* have
> > magically changing status would be better (which is why I was
> > advocating that the user set the constraints, and the kernel supplied
> > or failed outright).  Still I recognize that has its own problems.
>=20
> That is a neat idea, it could be a nice option, it lets userspace
> further customize the kernel allocator.
>=20
> But I don't have a use case in mind? The simplified things I know
> about want to attach their devices then allocate valid IOVA, they
> don't really have a notion about what IOVA regions they are willing to
> accept, or necessarily do hotplug.

The obvious use case is qemu (or whatever) emulating a vIOMMU.  The
emulation code knows the IOVA windows that are expected of the vIOMMU
(because that's a property of the emulated platform), and requests
them of the host IOMMU.  If the host can supply that, you're good
(this doesn't necessarily mean the host windows match exactly, just
that the requested windows fit within the host windows).  If not,
you report an error.  This can be done at any point when the host
windows might change - so try to attach a device that can't support
the requested windows, and it will fail.  Attaching a device which
shrinks the windows, but still fits the requested windows within, and
you're still good to go.

For a typical direct userspace case you don't want that.  However, it
probably *does* make sense for userspace to specify how large a window
it wants.  So some form that allows you to specify size without base
address also makes sense.  In that case the kernel would set a base
address according to the host IOMMU's capabilities, or fail if it
can't supply any window of the requested size.  When to allocate that
base address is a bit unclear though.  If you do it at window request
time, then you might pick something that a later device can't work
with.  If you do it later, it's less clear how to sensibly report it
to userspace.

One option might be to only allow IOAS_MAP (or COPY) operations after
windows are requested, but otherwise you can choose the order.  So,
things that have strict requirements for the windows (vIOMMU
emulation) would request the windows then add devices: they know the
windows they need, if the devices can't work with that, that's what
needs to fail.  A userspace driver, however, would attach the devices
it wants to use, then request a window (without specifying base
address).

A query ioctl to give the largest possible windows in the current
state could still be useful for debugging here, of course, but
wouldn't need to be used in the normal course of operation.

> What might be interesting is to have some option to load in a machine
> specific default ranges - ie the union of every group and and every
> iommu_domain. The idea being that after such a call hotplug of a
> device should be very likely to succeed.
>=20
> Though I don't have a user in mind..
>=20
> > > I added this:
> > >=20
> > >  * Query an IOAS for ranges of allowed IOVAs. Mapping IOVA outside th=
ese ranges
> > >  * is not allowed. out_num_iovas will be set to the total number of i=
ovas and
> > >  * the out_valid_iovas[] will be filled in as space permits. size sho=
uld include
> > >  * the allocated flex array.
> > >  *
> > >  * The allowed ranges are dependent on the HW path the DMA operation =
takes, and
> > >  * can change during the lifetime of the IOAS. A fresh empty IOAS wil=
l have a
> > >  * full range, and each attached device will narrow the ranges based =
on that
> > >  * devices HW restrictions.
> >=20
> > I think you need to be even more explicit about this: which exact
> > operations on the fd can invalidate exactly which items in the
> > information from this call?  Can it only ever be narrowed, or can it
> > be broadened with any operations?
>=20
> I think "attach" is the phrase we are using for that operation - it is
> not a specific IOCTL here because it happens on, say, the VFIO device FD.
>=20
> Let's add "detatching a device can widen the ranges. Userspace should
> query ranges after every attach/detatch to know what IOVAs are valid
> for mapping."
>=20
> > > > > +#define IOMMU_IOAS_COPY _IO(IOMMUFD_TYPE, IOMMUFD_CMD_IOAS_COPY)
> > > >=20
> > > > Since it can only copy a single mapping, what's the benefit of this
> > > > over just repeating an IOAS_MAP in the new IOAS?
> > >=20
> > > It causes the underlying pin accounting to be shared and can avoid
> > > calling GUP entirely.
> >=20
> > If that's the only purpose, then that needs to be right here in the
> > comments too.  So is expected best practice to IOAS_MAP everything you
> > might want to map into a sort of "scratch" IOAS, then IOAS_COPY the
> > mappings you actually end up wanting into the "real" IOASes for use?
>=20
> That is one possibility, yes. qemu seems to be using this to establish
> a clone ioas of an existing operational one which is another usage
> model.

Right, for qemu (or other hypervisors) the obvious choice would be to
create a "staging" IOAS where IOVA =3D=3D GPA, then COPY that into the vari=
ous
emulated bus IOASes.  For a userspace driver situation, I'm guessing
you'd map your relevant memory pool into an IOAS, then COPY to the
IOAS you need for whatever specific devices you're using.

> I added this additionally:
>=20
>  * This may be used to efficiently clone a subset of an IOAS to another, =
or as a
>  * kind of 'cache' to speed up mapping. Copy has an effciency advantage o=
ver
>  * establishing equivilant new mappings, as internal resources are shared=
, and
>  * the kernel will pin the user memory only once.

I think adding that helps substantially.

> > Seems like it would be nicer for the interface to just figure it out
> > for you: I can see there being sufficient complications with that to
> > have this slightly awkward interface, but I think it needs a rationale
> > to accompany it.
>=20
> It is more than complicates, the kernel has no way to accurately know
> when a user pointer is an alias of an existing user pointer or is
> something new because the mm has become incoherent.
>=20
> It is possible that uncoordinated modules in userspace could
> experience data corruption if the wrong decision is made - mm
> coherence with pinning is pretty weak in Linux.. Since I dislike that
> kind of unreliable magic I made it explicit.

Fair enough.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5GpsMNu5u4FPgM1n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJrfuUACgkQgypY4gEw
YSKJmBAAjde8YxJgDgcIJGqIujY7PnD2MmBLeZOaEsCrFRfKXGwIatnhEv2ZX5bu
AXgWLae0U0z8w0/Rv8sKSL9CXKPg5Jct8FQuCMVPS0B9icS7KhCycWmzq7GFVx42
eZlWgJ2L7alEfcJkZEEGg8ZulLXVK1M43npm7ioWb2op7C33QT7geqYZM6IQYPLd
wBeEDpAJ8qpahVBIlo1Taw365vSObAsRkPx7XVCHE/NW/OXTdC78i6Yj5C3VKDnS
6g8BTXceA7ysCdJq/V+iL8YdOJdl/XqCmEgfijtkm3/QVQC0VDFA2gyyJ1Q+T+ek
V3YjkjmCPH2Gv5wrR9YdudReapkC/XWpzJTspp7vCWUG0r3YKZDr6EhE1EQAEjZK
2KNr5VkuQuVvUXd1lm3Pi3WkSFz+GBnUJJXJH6PgGsR4RKAr0jXODWHjkyS/wIwU
vlFufPsY1erPobw1nF+GHVBloaAyxAVLG6S3ij8VSBAkcTeeehlHmCe3X9z3rkc3
WOHj+PkpyC+IO9PLnRMTM6ApfNDuMXKJ7HvW1tRyNE1Pe4bSRicR990h+cQ8LFLu
iCoDE+8hot3ceYLKcyzPDUMioR9mO3E0S4bAPPvf1dN2LFJI2Yku6k1AM7Mb10QF
hqYheMuthKmnad3ofZV1Fq+ZYy9Af4kyYOuGPpUlbzvozE6NebM=
=RvTr
-----END PGP SIGNATURE-----

--5GpsMNu5u4FPgM1n--

--===============3115968282846919397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============3115968282846919397==--
