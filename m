Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C007419D5F4
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 13:42:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CEF588E5F;
	Fri,  3 Apr 2020 11:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndgSywejHBdi; Fri,  3 Apr 2020 11:42:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1B3188E3D;
	Fri,  3 Apr 2020 11:42:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6818C1D89;
	Fri,  3 Apr 2020 11:42:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D1FBC07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 11:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 58E3588E0B
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 11:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNaG57VJ2gus for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 11:42:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7FC0188C8E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 11:42:23 +0000 (UTC)
IronPort-SDR: H+bgOSxwpWEWhcK8ZcxNr1XR5u4ujRSmnPlX1J5/HddxfVXLT+GGlz9vblFHfjaXp1cRPXAaF0
 Wvd/8GVMXIrw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 04:42:22 -0700
IronPort-SDR: 5iVGo26cmCIRFwKXXhqP8A2IymaOmPdiicCUqS/9qwaAtYkT4XqcFUOPP/Sw0EvfuMNejj/VNk
 unDdqrxXK2pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="242792637"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga008.fm.intel.com with ESMTP; 03 Apr 2020 04:42:22 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 3 Apr 2020 04:42:22 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 3 Apr 2020 04:42:21 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.89]) with mapi id 14.03.0439.000;
 Fri, 3 Apr 2020 19:42:18 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v1 2/2] vfio/pci: Emulate PASID/PRI capability for VFs
Thread-Topic: [PATCH v1 2/2] vfio/pci: Emulate PASID/PRI capability for VFs
Thread-Index: AQHWAEVGuXHNl3uJkkGgSITNIYV006hl/jEAgAFHqvA=
Date: Fri, 3 Apr 2020 11:42:17 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A220988@SHSMSX104.ccr.corp.intel.com>
References: <1584880394-11184-1-git-send-email-yi.l.liu@intel.com>
 <1584880394-11184-3-git-send-email-yi.l.liu@intel.com>
 <20200402165954.48d941ee@w520.home>
In-Reply-To: <20200402165954.48d941ee@w520.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, 
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun, Yi
 Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

Hi Alex,

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, April 3, 2020 7:00 AM
> To: Liu, Yi L <yi.l.liu@intel.com>
> Subject: Re: [PATCH v1 2/2] vfio/pci: Emulate PASID/PRI capability for VFs
> 
> On Sun, 22 Mar 2020 05:33:14 -0700
> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> 
> > From: Liu Yi L <yi.l.liu@intel.com>
> >
> > Per PCIe r5.0, sec 9.3.7.14, if a PF implements the PASID Capability, the
> > PF PASID configuration is shared by its VFs.  VFs must not implement their
> > own PASID Capability.
> >
> > Per PCIe r5.0, sec 9.3.7.11, VFs must not implement the PRI Capability. If
> > the PF implements PRI, it is shared by the VFs.
> >
> > On bare metal, it has been fixed by below efforts.
> > to PASID/PRI are
> > https://lkml.org/lkml/2019/9/5/996
> > https://lkml.org/lkml/2019/9/5/995
> >
> > This patch adds emulated PASID/PRI capabilities for VFs when assigned to
> > VMs via vfio-pci driver. This is required for enabling vSVA on pass-through
> > VFs as VFs have no PASID/PRI capability structure in its configure space.
> >
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_config.c | 325
> ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 323 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> > index 4b9af99..84b4ea0 100644
> > --- a/drivers/vfio/pci/vfio_pci_config.c
> > +++ b/drivers/vfio/pci/vfio_pci_config.c
> > @@ -1509,11 +1509,304 @@ static int vfio_cap_init(struct vfio_pci_device *vdev)
> >  	return 0;
> >  }
> >
> > +static int vfio_fill_custom_vconfig_bytes(struct vfio_pci_device *vdev,
> > +					int offset, uint8_t *data, int size)
> > +{
> > +	int ret = 0, data_offset = 0;
> > +
> > +	while (size) {
> > +		int filled;
> > +
> > +		if (size >= 4 && !(offset % 4)) {
> > +			__le32 *dwordp = (__le32 *)&vdev->vconfig[offset];
> > +			u32 dword;
> > +
> > +			memcpy(&dword, data + data_offset, 4);
> > +			*dwordp = cpu_to_le32(dword);
> 
> Why wouldn't we do:
> 
> *dwordp = cpu_to_le32(*(u32 *)(data + data_offset));
> 
> or better yet, increment data on each iteration for:
> 
> *dwordp = cpu_to_le32(*(u32 *)data);
> 
> vfio_fill_vconfig_bytes() does almost this same thing, getting the data
> from config space rather than a buffer, so please figure out how to
> avoid duplicating the logic.

Got another alternative. I may use the vfio_fill_vconfig_bytes()
to fill the cap data from PF's config space into VF's vconfig.
And after that, I can further modify the data in vconfig. e.g.
zero the control reg of pasid cap. would it make more sense?

> > +			filled = 4;
> > +		} else if (size >= 2 && !(offset % 2)) {
> > +			__le16 *wordp = (__le16 *)&vdev->vconfig[offset];
> > +			u16 word;
> > +
> > +			memcpy(&word, data + data_offset, 2);
> > +			*wordp = cpu_to_le16(word);
> > +			filled = 2;
> > +		} else {
> > +			u8 *byte = &vdev->vconfig[offset];
> > +
> > +			memcpy(byte, data + data_offset, 1);
[...]
> 
> > +
> > +	memset(map + epos, vpasid_cap.id, len);
> 
> See below.
> 
> > +	ret = vfio_fill_custom_vconfig_bytes(vdev, epos,
> > +					(u8 *)&vpasid_cap, len);
> > +	if (!ret) {
> > +		/*
> > +		 * Successfully filled in PASID cap, update
> > +		 * the next offset in previous cap header,
> > +		 * and also update caller about the offset
> > +		 * of next cap if any.
> > +		 */
> > +		u32 val = epos;
> > +		**prevp &= cpu_to_le32(~(0xffcU << 20));
> > +		**prevp |= cpu_to_le32(val << 20);
> > +		*prevp = (__le32 *)&vdev->vconfig[epos];
> > +		*next = epos + len;
> 
> Could we make this any more complicated?

I'm not sure if adding comments addressed this comment. After adding
new cap in vconfig, it needs to update the cap.next field of prior cap.
And in case of further add other cap, this function needs to update the
prevp pointer to the address of the newly added cap.

Regards,
Yi Liu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
