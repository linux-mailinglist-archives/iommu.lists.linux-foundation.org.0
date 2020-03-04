Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C271796E5
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 18:40:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A06CB848F5;
	Wed,  4 Mar 2020 17:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAg7mPffGHaR; Wed,  4 Mar 2020 17:40:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 26E1484C09;
	Wed,  4 Mar 2020 17:40:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11307C013E;
	Wed,  4 Mar 2020 17:40:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 510EEC013E;
 Wed,  4 Mar 2020 17:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4D96384581;
 Wed,  4 Mar 2020 17:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_uu-OV-ml7u; Wed,  4 Mar 2020 17:40:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 417A8843FD;
 Wed,  4 Mar 2020 17:40:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4515C2E2; Wed,  4 Mar 2020 18:40:50 +0100 (CET)
Date: Wed, 4 Mar 2020 18:40:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200304174045.GC3315@8bytes.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
 <20200303105523-mutt-send-email-mst@kernel.org>
 <20200304133707.GB4177@8bytes.org> <20200304153821.GE646000@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304153821.GE646000@myrica>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kevin.tian@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com,
 robin.murphy@arm.com
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

On Wed, Mar 04, 2020 at 04:38:21PM +0100, Jean-Philippe Brucker wrote:
> I agree with this. The problem is I don't know how to get a new ACPI table
> or change an existing one. It needs to go through the UEFI forum in order
> to be accepted, and I don't have any weight there. I've been trying to get
> the tiny change into IORT for ages. I haven't been given any convincing
> reason against it or offered any alternative, it's just stalled. The
> topology description introduced here wasn't my first choice either but
> unless someone can help finding another way into ACPI, I don't have a
> better idea.

A quote from the ACPI Specification (Version 6.3, Section 5.2.6,
Page 119):

	Table signatures will be reserved by the ACPI promoters and
	posted independently of this specification in ACPI errata and
	clarification documents on the ACPI web site. Requests to
	reserve a 4-byte alphanumeric table signature should be sent to
	the email address info@acpi.info and should include the purpose
	of the table and reference URL to a document that describes the
	table format. Tables defined outside of the ACPI specification
	may define data value encodings in either little endian or big
	endian format. For the purpose of clarity, external table
	definition documents should include the endian-ness of their
	data value encodings.

So it sounds like you need to specifiy the table format and send a
request to info@acpi.info to get a table signature for it.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
