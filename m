Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9C1BC68D
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 19:25:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B2A4882C3;
	Tue, 28 Apr 2020 17:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVJjbeUZL8bF; Tue, 28 Apr 2020 17:25:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E60DB882BE;
	Tue, 28 Apr 2020 17:25:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1B97C0172;
	Tue, 28 Apr 2020 17:25:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9DC9C0172
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 17:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E757F2286C
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 17:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kykFHBS1YpD7 for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 17:24:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by silver.osuosl.org (Postfix) with ESMTPS id 7752222846
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 17:24:57 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SHMjTX035908;
 Tue, 28 Apr 2020 17:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=corp-2020-01-29;
 bh=a1DRwVeeZI8m8zRrIZSIlkJajtV66/ligL8DUqPAkjE=;
 b=aJO9db+uOkB7e+WYGZXpXPaUytTt5+432QDnBzrkB9IFcDAm8NdTKrnhgbvT90fu5xwA
 ZfS/N++Pru08Hu4sTwXFhs3NaEABtCV42M4IZQuMuD2W3Xh3GaaAYYYOStSePUOT7hV9
 X2IVRvEYZq+fIT+cLXn5Tzc5LR6tq0EOUUBG8ye13FKmxtE4HhmB8ifs7ueHYkXhU0CF
 j8EF6v8Nsr9DTn9Nu70LDxzl/C9xSaTsCawSc7q4yo1AyQF+vT+jhOtOfOfKiuAD1qSl
 0ca+4QpA2ZUocSNimSYRkVjffZRD5BnfNYy8KXGOidf4Ya6FwUWZ+oN3DnEkBmTVRRzF 3w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 30nucg1bx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 17:24:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03SHMxng050675;
 Tue, 28 Apr 2020 17:24:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 30my0dseh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 17:24:53 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03SHOpMO019149;
 Tue, 28 Apr 2020 17:24:52 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Apr 2020 10:24:51 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id BC1D26A011D; Tue, 28 Apr 2020 13:25:14 -0400 (EDT)
Date: Tue, 28 Apr 2020 13:25:14 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, joe.jin@oracle.com
Subject: Re: [PATCH] xen/swiotlb: correct the check for
 xen_destroy_contiguous_region
Message-ID: <20200428172514.GA24178@char.us.oracle.com>
References: <1588059225-11245-1-git-send-email-peng.fan@nxp.com>
 <1c01e97a-adcd-a703-55b5-8975b4ce4d2c@suse.com>
 <DB6PR0402MB2760A05135338B0CBB28123488AC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <dba804ea-4268-24ff-7447-ddef00e9e20c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dba804ea-4268-24ff-7447-ddef00e9e20c@suse.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=2 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9605
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=2 malwarescore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280137
Cc: Peng Fan <peng.fan@nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Apr 28, 2020 at 12:19:41PM +0200, J=FCrgen Gro=DF wrote:
> On 28.04.20 10:25, Peng Fan wrote:

Adding Joe Jin.

Joe, didn't you have some ideas on how this could be implemented?

> > > Subject: Re: [PATCH] xen/swiotlb: correct the check for
> > > xen_destroy_contiguous_region
> > > =

> > > On 28.04.20 09:33, peng.fan@nxp.com wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > > =

> > > > When booting xen on i.MX8QM, met:
> > > > "
> > > > [    3.602128] Unable to handle kernel paging request at virtual ad=
dress
> > > 0000000000272d40
> > > > [    3.610804] Mem abort info:
> > > > [    3.613905]   ESR =3D 0x96000004
> > > > [    3.617332]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > > > [    3.623211]   SET =3D 0, FnV =3D 0
> > > > [    3.626628]   EA =3D 0, S1PTW =3D 0
> > > > [    3.630128] Data abort info:
> > > > [    3.633362]   ISV =3D 0, ISS =3D 0x00000004
> > > > [    3.637630]   CM =3D 0, WnR =3D 0
> > > > [    3.640955] [0000000000272d40] user address but active_mm is
> > > swapper
> > > > [    3.647983] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > > > [    3.654137] Modules linked in:
> > > > [    3.677285] Hardware name: Freescale i.MX8QM MEK (DT)
> > > > [    3.677302] Workqueue: events deferred_probe_work_func
> > > > [    3.684253] imx6q-pcie 5f000000.pcie: PCI host bridge to bus 000=
0:00
> > > > [    3.688297] pstate: 60000005 (nZCv daif -PAN -UAO)
> > > > [    3.688310] pc : xen_swiotlb_free_coherent+0x180/0x1c0
> > > > [    3.693993] pci_bus 0000:00: root bus resource [bus 00-ff]
> > > > [    3.701002] lr : xen_swiotlb_free_coherent+0x44/0x1c0
> > > > "
> > > > =

> > > > In xen_swiotlb_alloc_coherent, if !(dev_addr + size - 1 <=3D dma_ma=
sk)
> > > > or range_straddles_page_boundary(phys, size) are true, it will crea=
te
> > > > contiguous region. So when free, we need to free contiguous region =
use
> > > > upper check condition.
> > > =

> > > No, this will break PV guests on x86.
> > =

> > Could you share more details why alloc and free not matching for the ch=
eck?
> =

> xen_create_contiguous_region() is needed only in case:
> =

> - the bus address is not within dma_mask, or
> - the memory region is not physically contiguous (can happen only for
>   PV guests)
> =

> In any case it should arrange for the memory to be suitable for the
> DMA operation, so to be contiguous and within dma_mask afterwards. So
> xen_destroy_contiguous_region() should only ever called for areas
> which match above criteria, as otherwise we can be sure
> xen_create_contiguous_region() was not used for making the area DMA-able
> in the beginning.
> =

> And this is very important in the PV case, as in those guests the page
> tables are containing the host-PFNs, not the guest-PFNS, and
> xen_create_contiguous_region() will fiddle with host- vs. guest-PFN
> arrangements, and xen_destroy_contiguous_region() is reverting this
> fiddling. Any call of xen_destroy_contiguous_region() for an area it
> was not intended to be called for might swap physical pages beneath
> random virtual addresses, which was the reason for this test to be
> added by me.
> =

> =

> Juergen
> =

> > =

> > Thanks,
> > Peng.
> > =

> > > =

> > > I think there is something wrong with your setup in combination with =
the ARM
> > > xen_create_contiguous_region() implementation.
> > > =

> > > Stefano?
> > > =

> > > =

> > > Juergen
> > > =

> > > > =

> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >    drivers/xen/swiotlb-xen.c | 4 ++--
> > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > =

> > > > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > > > index b6d27762c6f8..ab96e468584f 100644
> > > > --- a/drivers/xen/swiotlb-xen.c
> > > > +++ b/drivers/xen/swiotlb-xen.c
> > > > @@ -346,8 +346,8 @@ xen_swiotlb_free_coherent(struct device *hwdev,
> > > size_t size, void *vaddr,
> > > >    	/* Convert the size to actually allocated. */
> > > >    	size =3D 1UL << (order + XEN_PAGE_SHIFT);
> > > > =

> > > > -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> > > > -		     range_straddles_page_boundary(phys, size)) &&
> > > > +	if (((dev_addr + size - 1 > dma_mask) ||
> > > > +	    range_straddles_page_boundary(phys, size)) &&
> > > >    	    TestClearPageXenRemapped(virt_to_page(vaddr)))
> > > >    		xen_destroy_contiguous_region(phys, order);
> > > > =

> > > > =

> > =

> =

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
