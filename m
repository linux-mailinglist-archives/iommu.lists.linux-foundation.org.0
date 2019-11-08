Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E5F5B7B
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 23:57:57 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74046D48;
	Fri,  8 Nov 2019 22:57:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E6C5FC7D
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 22:57:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8AB23196
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 22:57:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2019 14:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; d="scan'208";a="228331396"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by fmsmga004.fm.intel.com with ESMTP; 08 Nov 2019 14:57:50 -0800
Date: Fri, 8 Nov 2019 15:02:20 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH] iommu/vt-d: Fix QI_DEV_IOTLB_PFSID and
	QI_DEV_EIOTLB_PFSID macros
Message-ID: <20191108150220.0c2aeb89@jacob-builder>
In-Reply-To: <20191108155803.15051-1-eric.auger@redhat.com>
References: <20191108155803.15051-1-eric.auger@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri,  8 Nov 2019 16:58:03 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> For both PASID-based-Device-TLB Invalidate Descriptor and
> Device-TLB Invalidate Descriptor, the Physical Function Source-ID
> value is split according to this layout:
> 
> PFSID[3:0] is set at offset 12 and PFSID[15:4] is put at offset 52.
> Fix the part laid out at offset 52.
> 
> Fixes: 0f725561e1684 ("iommu/vt-d: Add definitions for PFSID")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/linux/intel-iommu.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
> index ed11ef594378..6d8bf4bdf240 100644
> --- a/include/linux/intel-iommu.h
> +++ b/include/linux/intel-iommu.h
> @@ -336,7 +336,8 @@ enum {
>  #define QI_DEV_IOTLB_SID(sid)	((u64)((sid) & 0xffff) << 32)
>  #define QI_DEV_IOTLB_QDEP(qdep)	(((qdep) & 0x1f) << 16)
>  #define QI_DEV_IOTLB_ADDR(addr)	((u64)(addr) & VTD_PAGE_MASK)
> -#define QI_DEV_IOTLB_PFSID(pfsid) (((u64)(pfsid & 0xf) << 12) |
> ((u64)(pfsid & 0xfff) << 52)) +#define QI_DEV_IOTLB_PFSID(pfsid)
> (((u64)(pfsid & 0xf) << 12) | \
> +				   ((u64)((pfsid >> 4) & 0xfff) <<
> 52)) #define QI_DEV_IOTLB_SIZE	1
>  #define QI_DEV_IOTLB_MAX_INVS	32
>  
> @@ -360,7 +361,8 @@ enum {
>  #define QI_DEV_EIOTLB_PASID(p)	(((u64)p) << 32)
>  #define QI_DEV_EIOTLB_SID(sid)	((u64)((sid) & 0xffff) << 16)
>  #define QI_DEV_EIOTLB_QDEP(qd)	((u64)((qd) & 0x1f) << 4)
> -#define QI_DEV_EIOTLB_PFSID(pfsid) (((u64)(pfsid & 0xf) << 12) |
> ((u64)(pfsid & 0xfff) << 52)) +#define QI_DEV_EIOTLB_PFSID(pfsid)
> (((u64)(pfsid & 0xf) << 12) | \
> +				    ((u64)((pfsid >> 4) & 0xfff) <<
> 52)) #define QI_DEV_EIOTLB_MAX_INVS	32
>  
>  /* Page group response descriptor QW0 */

Good catch. Thanks!

Acked-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
