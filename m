Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B341A63E0
	for <lists.iommu@lfdr.de>; Mon, 13 Apr 2020 09:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19B6484506;
	Mon, 13 Apr 2020 07:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcK9lWPV9ctC; Mon, 13 Apr 2020 07:55:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1526384E49;
	Mon, 13 Apr 2020 07:55:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F15A3C1D89;
	Mon, 13 Apr 2020 07:55:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1049C0172
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 07:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9B72884506
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 07:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7UOr8wwsNiU for <iommu@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 07:55:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A52F684478
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 07:55:05 +0000 (UTC)
IronPort-SDR: dDDgYKvlhRI7Bxzh76Sb3CEgPusGi0GqYPblcZKxkZPepNVRnlf+2unpH9O6ncsPEtxt5MLn/3
 ZKwUicknrAuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 00:55:05 -0700
IronPort-SDR: VOaIKfMCzR1du3JANgnxCa7cpABRhIOZQb23o9yOs+zwnp86GsiZ/4OjHAr1fpDUNd/OiNsSC/
 XXKRGm6M5MQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; d="scan'208";a="399541005"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga004.jf.intel.com with ESMTP; 13 Apr 2020 00:55:04 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Apr 2020 00:55:04 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.22]) with mapi id 14.03.0439.000;
 Mon, 13 Apr 2020 15:54:59 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Raj, Ashok" <ashok.raj@linux.intel.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v1 2/2] vfio/pci: Emulate PASID/PRI capability for VFs
Thread-Topic: [PATCH v1 2/2] vfio/pci: Emulate PASID/PRI capability for VFs
Thread-Index: AQHWAEVGCz5QQWvL/U+nYnlD7MiZ7Khl/jEAgACVNICAAJ/EgIAF8c6ggAA/A4CAAMnRgIAAzpAAgAb/OoCAAMrPQA==
Date: Mon, 13 Apr 2020 07:54:59 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D81A2EE@SHSMSX104.ccr.corp.intel.com>
References: <1584880394-11184-1-git-send-email-yi.l.liu@intel.com>
 <1584880394-11184-3-git-send-email-yi.l.liu@intel.com>
 <20200402165954.48d941ee@w520.home>
 <A2975661238FB949B60364EF0F2C25743A2204FE@SHSMSX104.ccr.corp.intel.com>
 <20200403112545.6c115ba3@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D80E13D@SHSMSX104.ccr.corp.intel.com>
 <20200407095801.648b1371@w520.home> <20200408040021.GS67127@otc-nc-03>
 <20200408101940.3459943d@w520.home>
 <20200413031043.GA18183@araj-mobl1.jf.intel.com>
In-Reply-To: <20200413031043.GA18183@araj-mobl1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Bjorn
 Helgaas <bhelgaas@google.com>, "Sun, Yi Y" <yi.y.sun@intel.com>, "Wu,
 Hao" <hao.wu@intel.com>
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

> From: Raj, Ashok <ashok.raj@linux.intel.com>
> Sent: Monday, April 13, 2020 11:11 AM
> 
> On Wed, Apr 08, 2020 at 10:19:40AM -0600, Alex Williamson wrote:
> > On Tue, 7 Apr 2020 21:00:21 -0700
> > "Raj, Ashok" <ashok.raj@intel.com> wrote:
> >
> > > Hi Alex
> > >
> > > + Bjorn
> >
> >  + Don
> >
> > > FWIW I can't understand why PCI SIG went different ways with ATS,
> > > where its enumerated on PF and VF. But for PASID and PRI its only
> > > in PF.
> > >
> > > I'm checking with our internal SIG reps to followup on that.
> > >
> > > On Tue, Apr 07, 2020 at 09:58:01AM -0600, Alex Williamson wrote:
> > > > > Is there vendor guarantee that hidden registers will locate at the
> > > > > same offset between PF and VF config space?
> > > >
> > > > I'm not sure if the spec really precludes hidden registers, but the
> > > > fact that these registers are explicitly outside of the capability
> > > > chain implies they're only intended for device specific use, so I'd say
> > > > there are no guarantees about anything related to these registers.
> > >
> > > As you had suggested in the other thread, we could consider
> > > using the same offset as in PF, but even that's a better guess
> > > still not reliable.
> > >
> > > The other option is to maybe extend driver ops in the PF to expose
> > > where the offsets should be. Sort of adding the quirk in the
> > > implementation.
> > >
> > > I'm not sure how prevalent are PASID and PRI in VF devices. If SIG is
> resisting
> > > making VF's first class citizen, we might ask them to add some verbiage
> > > to suggest leave the same offsets as PF open to help emulation software.
> >
> > Even if we know where to expose these capabilities on the VF, it's not
> > clear to me how we can actually virtualize the capability itself.  If
> > the spec defines, for example, an enable bit as r/w then software that
> > interacts with that register expects the bit is settable.  There's no
> > protocol for "try to set the bit and re-read it to see if the hardware
> > accepted it".  Therefore a capability with a fixed enable bit
> > representing the state of the PF, not settable by the VF, is
> > disingenuous to the spec.
> 
> I think we are all in violent agreement. A lot of times the pci spec gets
> defined several years ahead of real products and no one remembers
> the justification on why they restricted things the way they did.
> 
> Maybe someone early product wasn't quite exposing these features to the
> VF
> and hence the spec is bug compatible :-)
> 
> >
> > If what we're trying to do is expose that PASID and PRI are enabled on
> > the PF to a VF driver, maybe duplicating the PF capabilities on the VF
> > without the ability to control it is not the right approach.  Maybe we
> 
> As long as the capability enable is only provided when the PF has enabled
> the feature. Then it seems the hardware seems to do the right thing.
> 
> Assume we expose PASID/PRI only when PF has enabled it. It will be the
> case since the PF driver needs to exist, and IOMMU would have set the
> PASID/PRI/ATS on PF.
> 
> If the emulation is purely spoofing the capability. Once vIOMMU driver
> enables PASID, the context entries for the VF are completely independent
> from the PF context entries.
> 
> vIOMMU would enable PASID, and we just spoof the PASID capability.
> 
> If vIOMMU or guest for some reason does disable_pasid(), then the
> vIOMMU driver can disaable PASID on the VF context entries. So the VF
> although the capability is blanket enabled on PF, IOMMU gaurantees the
> transactions are blocked.
> 
> 
> In the interim, it seems like the intent of the virtual capability
> can be honored via help from the IOMMU for the controlling aspect..
> 
> Did i miss anything?

Above works for emulating the enable bit (under the assumption that 
PF driver won't disable pasid when vf is assigned). However, there are 
also "Execute permission enable" and "Privileged mode enable" bits in 
PASID control registers. I don't know how those bits could be cleanly 
emulated when the guest writes a value different from PF's...

Similar problem also exists when talking about PRI emulation, e.g. 
to enable PRI the software usually waits until the 'stopped' bit
is set (indicating all previously issued requests have completed). How
to emulate this bit accurately when one guest toggles the enable bit
while the PF and other VFs are actively issuing page requests through
the shared page request interface? from pcie spec I didn't find a way
to catch when all previously-issued requests from a specific VF have
completed. Can a conservative big-enough timeout value help here?
I don't know... similar puzzle also exists for emulating the 'reset'
control bit which is supposed to clear the pending request state for
the whole page request interface.

I feel the main problem in pcie spec is that, while they invent SR-IOV
to address I/O virtualization requirement (where strict isolation is
required), they blurred the boundary by leaving some shared resource 
cross PF and VFs which imply sort of cooperation between PF and VF
drivers. On bare metal such cooperation is easy to build, by enabling/
disabling a capability en mass, by using the same set of setting, etc.
However it doesn't consider the virtualization case where a VF is
assigned to the guest which considers the VF as a standard PCI/PCIe 
endpoint thus such cooperation is missing. A vendor capability could
help fix the gap here but making it adopted by major guest OSes will
take time. But honestly speaking I don't know other good alternative 
now... :/

> 
> > need new capabilities exposing these as slave features that cannot be
> > controlled?  We could define our own vendor capability for this, but of
> > course we have both the where to put it in config space issue, as well
> > as the issue of trying to push an ad-hoc standard.  vfio could expose
> > these as device features rather than emulating capabilities, but that
> > still leaves a big gap between vfio in the hypervisor and the driver in
> > the guest VM.  That might still help push the responsibility and policy
> > for how to expose it to the VM as a userspace problem though.
> 
> I think this is a good long term solution, but if the vIOMMU implenentations
> can carry us for the time being, we can probably defer them unless
> we are stuck.
> 
> >
> > I agree though, I don't know why the SIG would preclude implementing
> > per VF control of these features.  Thanks,
> >
> 
> Cheers,
> Ashok

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
