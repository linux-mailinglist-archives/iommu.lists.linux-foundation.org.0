Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 221092274F6
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 03:45:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDCB687C0A;
	Tue, 21 Jul 2020 01:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPMm-Pufl0F0; Tue, 21 Jul 2020 01:45:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E48168791F;
	Tue, 21 Jul 2020 01:45:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C820DC08A6;
	Tue, 21 Jul 2020 01:45:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD9B7C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 01:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B50A721135
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 01:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82WH4IiidNRB for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 01:45:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id C0F7220512
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 01:45:48 +0000 (UTC)
IronPort-SDR: ptgF4WcqpEaDk2lFkv+H2ihtdY+j4NrpVsqr8s5C0hkPYmOzku3roXKE4rRrvgyOT9w9uk7YXB
 s0fGrbRYo7gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="234893427"
X-IronPort-AV: E=Sophos;i="5.75,377,1589266800"; d="scan'208";a="234893427"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 18:45:48 -0700
IronPort-SDR: KRaxwk92I+jel9tcLEJ2Nj2mexLNFK2VnXAavZ9QcNJIPrp9Lbx2Yh71ym9Ka0GtwL3+p924nn
 p5m1lOXlOLCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,377,1589266800"; d="scan'208";a="326229072"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2020 18:45:48 -0700
Date: Mon, 20 Jul 2020 18:52:33 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v5 2/5] iommu/uapi: Add argsz for user filled data
Message-ID: <20200720185233.3e5841c1@jacob-builder>
In-Reply-To: <1538ec69-62a2-ea04-0870-a583fc63a2bf@redhat.com>
References: <1594925117-64892-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594925117-64892-3-git-send-email-jacob.jun.pan@linux.intel.com>
 <1538ec69-62a2-ea04-0870-a583fc63a2bf@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Fri, 17 Jul 2020 15:44:23 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Jacob,
> 
> On 7/16/20 8:45 PM, Jacob Pan wrote:
> > As IOMMU UAPI gets extended, user data size may increase. To support
> > backward compatibiliy, this patch introduces a size field to each
> > UAPI data structures. It is *always* the responsibility for the
> > user to fill in the correct size. Padding fields are adjusted to
> > ensure 8 byte alignment.
> > 
> > Specific scenarios for user data handling are documented in:
> > Documentation/userspace-api/iommu.rst
> > 
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  include/uapi/linux/iommu.h | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> > index e907b7091a46..d5e9014f690e 100644
> > --- a/include/uapi/linux/iommu.h
> > +++ b/include/uapi/linux/iommu.h
> > @@ -135,6 +135,7 @@ enum iommu_page_response_code {
> >  
> >  /**
> >   * struct iommu_page_response - Generic page response information
> > + * @argsz: User filled size of this data
> >   * @version: API version of this structure
> >   * @flags: encodes whether the corresponding fields are valid
> >   *         (IOMMU_FAULT_PAGE_RESPONSE_* values)
> > @@ -143,6 +144,7 @@ enum iommu_page_response_code {
> >   * @code: response code from &enum iommu_page_response_code
> >   */
> >  struct iommu_page_response {
> > +	__u32	argsz;
> >  #define IOMMU_PAGE_RESP_VERSION_1	1  
> Don't you need to incr the version for all the modified structs?
not literal "flags" but @cache and @granularity are flags in reality. I
think that is OK. I also updated document to say "flags or equivalent".

> >  	__u32	version;
> >  #define IOMMU_PAGE_RESP_PASID_VALID	(1 << 0)
> > @@ -218,6 +220,7 @@ struct iommu_inv_pasid_info {
> >  /**
> >   * struct iommu_cache_invalidate_info - First level/stage
> > invalidation
> >   *     information
> > + * @argsz: User filled size of this data
> >   * @version: API version of this structure
> >   * @cache: bitfield that allows to select which caches to
> > invalidate
> >   * @granularity: defines the lowest granularity used for the
> > invalidation: @@ -246,6 +249,7 @@ struct iommu_inv_pasid_info {
> >   * must support the used granularity.
> >   */
> >  struct iommu_cache_invalidate_info {
> > +	__u32	argsz;
> >  #define IOMMU_CACHE_INVALIDATE_INFO_VERSION_1 1
> >  	__u32	version;  
> so there is no "flags" field in this struct. Is it OK?
> >  /* IOMMU paging structure cache */
> > @@ -255,7 +259,7 @@ struct iommu_cache_invalidate_info {
> >  #define IOMMU_CACHE_INV_TYPE_NR		(3)
> >  	__u8	cache;
> >  	__u8	granularity;
> > -	__u8	padding[2];
> > +	__u8	padding[6];
> >  	union {
> >  		struct iommu_inv_pasid_info pasid_info;
> >  		struct iommu_inv_addr_info addr_info;
> > @@ -292,6 +296,7 @@ struct iommu_gpasid_bind_data_vtd {
> >  
> >  /**
> >   * struct iommu_gpasid_bind_data - Information about device and
> > guest PASID binding
> > + * @argsz:	User filled size of this data
> >   * @version:	Version of this data structure
> >   * @format:	PASID table entry format
> >   * @flags:	Additional information on guest bind request
> > @@ -309,17 +314,18 @@ struct iommu_gpasid_bind_data_vtd {
> >   * PASID to host PASID based on this bind data.
> >   */
> >  struct iommu_gpasid_bind_data {
> > +	__u32 argsz;
> >  #define IOMMU_GPASID_BIND_VERSION_1	1
> >  	__u32 version;
> >  #define IOMMU_PASID_FORMAT_INTEL_VTD	1
> >  	__u32 format;
> > +	__u32 addr_width;
> >  #define IOMMU_SVA_GPASID_VAL	(1 << 0) /* guest PASID valid
> > */ __u64 flags;
> >  	__u64 gpgd;
> >  	__u64 hpasid;
> >  	__u64 gpasid;
> > -	__u32 addr_width;
> > -	__u8  padding[12];
> > +	__u8  padding[8];
> >  	/* Vendor specific data */
> >  	union {
> >  		struct iommu_gpasid_bind_data_vtd vtd;
> >   
> Thanks
> 
> Eric
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
