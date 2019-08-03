Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF968086D
	for <lists.iommu@lfdr.de>; Sat,  3 Aug 2019 23:36:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 739291B51;
	Sat,  3 Aug 2019 21:36:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 38DAF1B40
	for <iommu@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 21:35:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
	[195.113.26.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7D603712
	for <iommu@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 21:34:59 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
	id 6D9558028E; Sat,  3 Aug 2019 23:34:42 +0200 (CEST)
Date: Sat, 3 Aug 2019 23:34:54 +0200
From: Pavel Machek <pavel@ucw.cz>
To: pavel@ucw.cz
Subject: Re: [PATCH 4.19 17/32] iommu/vt-d: Dont queue_iova() if there is no
	flush queue
Message-ID: <20190803213453.GA22416@amd>
References: <20190802092101.913646560@linuxfoundation.org>
	<20190802092107.177554199@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20190802092107.177554199@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Joerg Roedel <jroedel@suse.de>, Dmitry Safonov <dima@arista.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>
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
Content-Type: multipart/mixed; boundary="===============0392698716409972620=="
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


--===============0392698716409972620==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -3721,7 +3721,7 @@ static void intel_unmap(struct device *d
> =20
>  	freelist =3D domain_unmap(domain, start_pfn, last_pfn);
> =20
> -	if (intel_iommu_strict) {
> +	if (intel_iommu_strict || !has_iova_flush_queue(&domain->iovad)) {
>  		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
>  				      nrpages, !freelist, 0);
>  		/* free iova */
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -65,9 +65,14 @@ init_iova_domain(struct iova_domain *iov
>  }
>  EXPORT_SYMBOL_GPL(init_iova_domain);
> =20
> +bool has_iova_flush_queue(struct iova_domain *iovad)
> +{
> +	return !!iovad->fq;

Should this be READ_ONCE()?

> @@ -100,13 +106,17 @@ int init_iova_flush_queue(struct iova_do
>  	for_each_possible_cpu(cpu) {
>  		struct iova_fq *fq;
> =20
> -		fq =3D per_cpu_ptr(iovad->fq, cpu);
> +		fq =3D per_cpu_ptr(queue, cpu);
>  		fq->head =3D 0;
>  		fq->tail =3D 0;
> =20
>  		spin_lock_init(&fq->lock);
>  	}
> =20
> +	smp_wmb();
> +
> +	iovad->fq =3D queue;
> +

Could we have a comment why the barrier is needed, and perhaps there
should be oposing smp_rmb() somewhere? Does this need to be
WRITE_ONCE() as it is racing against reader?

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1F/f0ACgkQMOfwapXb+vJ8hwCghW/VF74rPkoViX5680EJXynZ
DB4An1DDuEsGTf1CR7WYolsbVZ06SCYz
=ZU5B
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

--===============0392698716409972620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============0392698716409972620==--
