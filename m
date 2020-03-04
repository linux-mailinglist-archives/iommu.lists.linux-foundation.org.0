Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 202E0179B50
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 22:55:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C54F284463;
	Wed,  4 Mar 2020 21:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTnWqVTdx9nG; Wed,  4 Mar 2020 21:55:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE393849D2;
	Wed,  4 Mar 2020 21:55:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C027FC013E;
	Wed,  4 Mar 2020 21:55:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BB75C013E;
 Wed,  4 Mar 2020 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 67E2684961;
 Wed,  4 Mar 2020 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKdRxjlv9yDj; Wed,  4 Mar 2020 21:54:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C8B1184463;
 Wed,  4 Mar 2020 21:54:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D7A532E2; Wed,  4 Mar 2020 22:54:54 +0100 (CET)
Date: Wed, 4 Mar 2020 22:54:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: "Jacob Pan (Jun)" <jacob.jun.pan@intel.com>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200304215449.GE3315@8bytes.org>
References: <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
 <20200303105523-mutt-send-email-mst@kernel.org>
 <20200304133707.GB4177@8bytes.org> <20200304153821.GE646000@myrica>
 <20200304174045.GC3315@8bytes.org>
 <20200304133744.00000fdb@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304133744.00000fdb@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 "Rothman, Michael A" <michael.a.rothman@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 jasowang@redhat.com, "Kaneda, Erik" <erik.kaneda@intel.com>,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, bhelgaas@google.com, robin.murphy@arm.com
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

On Wed, Mar 04, 2020 at 01:37:44PM -0800, Jacob Pan (Jun) wrote:
> + Mike and Erik who work closely on UEFI and ACPICA.
> 
> Copy paste Erik's initial response below on how to get a new table,
> seems to confirm with the process you stated above.
> 
> "Fairly easy. You reserve a 4-letter symbol by sending a message
> requesting to reserve the signature to Mike or the ASWG mailing list or
> info@acpi.info

Great! I think this is going to be the path forward here.

Regards,

	Joerg

> 
> There is also another option. You can have ASWG own this new table so
> that not one entity or company owns the new table."
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
