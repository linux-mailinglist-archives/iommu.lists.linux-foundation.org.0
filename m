Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C31A8FBF
	for <lists.iommu@lfdr.de>; Wed, 15 Apr 2020 02:36:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 089DB2050E;
	Wed, 15 Apr 2020 00:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFwOyKO5gxcn; Wed, 15 Apr 2020 00:36:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 66B12204F1;
	Wed, 15 Apr 2020 00:36:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AA51C0172;
	Wed, 15 Apr 2020 00:36:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B610C0172
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 00:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 755E185D2B
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 00:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSxz3HqKDhF6 for <iommu@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:36:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 02D9285CFF
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 00:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586910967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=786rE4ds0gc5WHCPY+q2eHQ8wC/MbWgvAdjaVMoQMSc=;
 b=Y0tiKxEaZFr8vcojtlEsScQvhMKk9OUzGP9xQ5Gv9/zBvCVNUt5IdSxQ1tmDquNKUdkT89
 eSMsxKoU+nrR8O2v1349DK0f4Wmr9ZSNoqcz/ZvHboUIfnbDsIylKUyOU8ttcq7n1Mw95b
 zDjHBe/qCiT9hSMLRcsf7FJFoIS1U4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-kNJ3Cwp3NFe9fEEBqLLOhA-1; Tue, 14 Apr 2020 20:36:05 -0400
X-MC-Unique: kNJ3Cwp3NFe9fEEBqLLOhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACBE813F9;
 Wed, 15 Apr 2020 00:36:03 +0000 (UTC)
Received: from x1.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A33425D9E5;
 Wed, 15 Apr 2020 00:36:02 +0000 (UTC)
Date: Tue, 14 Apr 2020 18:36:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v1 2/2] vfio/pci: Emulate PASID/PRI capability for VFs
Message-ID: <20200414183602.7de084b0@x1.home>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D81F946@SHSMSX104.ccr.corp.intel.com>
References: <1584880394-11184-1-git-send-email-yi.l.liu@intel.com>
 <1584880394-11184-3-git-send-email-yi.l.liu@intel.com>
 <20200402165954.48d941ee@w520.home>
 <A2975661238FB949B60364EF0F2C25743A2204FE@SHSMSX104.ccr.corp.intel.com>
 <20200403112545.6c115ba3@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D80E13D@SHSMSX104.ccr.corp.intel.com>
 <20200407095801.648b1371@w520.home>
 <20200408040021.GS67127@otc-nc-03>
 <20200408101940.3459943d@w520.home>
 <20200413031043.GA18183@araj-mobl1.jf.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D81A31F@SHSMSX104.ccr.corp.intel.com>
 <20200413132122.46825849@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D81D376@SHSMSX104.ccr.corp.intel.com>
 <20200413212836.117b4c86@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D81D456@SHSMSX104.ccr.corp.intel.com>
 <20200414092401.039edef6@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D81F946@SHSMSX104.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Tue, 14 Apr 2020 23:57:33 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, April 14, 2020 11:24 PM
> > 
> > On Tue, 14 Apr 2020 03:42:42 +0000
> > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> >   
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Tuesday, April 14, 2020 11:29 AM
> > > >
> > > > On Tue, 14 Apr 2020 02:40:58 +0000
> > > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > > >  
> > > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > > Sent: Tuesday, April 14, 2020 3:21 AM
> > > > > >
> > > > > > On Mon, 13 Apr 2020 08:05:33 +0000
> > > > > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > > > > >  
> > > > > > > > From: Tian, Kevin
> > > > > > > > Sent: Monday, April 13, 2020 3:55 PM
> > > > > > > >  
> > > > > > > > > From: Raj, Ashok <ashok.raj@linux.intel.com>
> > > > > > > > > Sent: Monday, April 13, 2020 11:11 AM
> > > > > > > > >
> > > > > > > > > On Wed, Apr 08, 2020 at 10:19:40AM -0600, Alex Williamson  
> > wrote:  
> > > > > > > > > > On Tue, 7 Apr 2020 21:00:21 -0700
> > > > > > > > > > "Raj, Ashok" <ashok.raj@intel.com> wrote:
> > > > > > > > > >  
> > > > > > > > > > > Hi Alex
> > > > > > > > > > >
> > > > > > > > > > > + Bjorn  
> > > > > > > > > >
> > > > > > > > > >  + Don
> > > > > > > > > >  
> > > > > > > > > > > FWIW I can't understand why PCI SIG went different ways  
> > with  
> > > > ATS,  
> > > > > > > > > > > where its enumerated on PF and VF. But for PASID and PRI its  
> > > > only  
> > > > > > > > > > > in PF.
> > > > > > > > > > >
> > > > > > > > > > > I'm checking with our internal SIG reps to followup on that.
> > > > > > > > > > >
> > > > > > > > > > > On Tue, Apr 07, 2020 at 09:58:01AM -0600, Alex Williamson  
> > > > wrote:  
> > > > > > > > > > > > > Is there vendor guarantee that hidden registers will locate  
> > at  
> > > > the  
> > > > > > > > > > > > > same offset between PF and VF config space?  
> > > > > > > > > > > >
> > > > > > > > > > > > I'm not sure if the spec really precludes hidden registers,  
> > but  
> > > > the  
> > > > > > > > > > > > fact that these registers are explicitly outside of the  
> > capability  
> > > > > > > > > > > > chain implies they're only intended for device specific use,  
> > so  
> > > > I'd  
> > > > > > say  
> > > > > > > > > > > > there are no guarantees about anything related to these  
> > > > registers.  
> > > > > > > > > > >
> > > > > > > > > > > As you had suggested in the other thread, we could consider
> > > > > > > > > > > using the same offset as in PF, but even that's a better guess
> > > > > > > > > > > still not reliable.
> > > > > > > > > > >
> > > > > > > > > > > The other option is to maybe extend driver ops in the PF to  
> > > > expose  
> > > > > > > > > > > where the offsets should be. Sort of adding the quirk in the
> > > > > > > > > > > implementation.
> > > > > > > > > > >
> > > > > > > > > > > I'm not sure how prevalent are PASID and PRI in VF devices. If  
> > > > SIG is  
> > > > > > > > > resisting  
> > > > > > > > > > > making VF's first class citizen, we might ask them to add  
> > some  
> > > > > > verbiage  
> > > > > > > > > > > to suggest leave the same offsets as PF open to help  
> > emulation  
> > > > > > software.  
> > > > > > > > > >
> > > > > > > > > > Even if we know where to expose these capabilities on the VF,  
> > it's  
> > > > not  
> > > > > > > > > > clear to me how we can actually virtualize the capability itself.  
> > If  
> > > > > > > > > > the spec defines, for example, an enable bit as r/w then  
> > software  
> > > > that  
> > > > > > > > > > interacts with that register expects the bit is settable.  There's  
> > no  
> > > > > > > > > > protocol for "try to set the bit and re-read it to see if the  
> > hardware  
> > > > > > > > > > accepted it".  Therefore a capability with a fixed enable bit
> > > > > > > > > > representing the state of the PF, not settable by the VF, is
> > > > > > > > > > disingenuous to the spec.  
> > > > > > > > >
> > > > > > > > > I think we are all in violent agreement. A lot of times the pci spec  
> > > > gets  
> > > > > > > > > defined several years ahead of real products and no one  
> > > > remembers  
> > > > > > > > > the justification on why they restricted things the way they did.
> > > > > > > > >
> > > > > > > > > Maybe someone early product wasn't quite exposing these  
> > features  
> > > > to  
> > > > > > the  
> > > > > > > > > VF
> > > > > > > > > and hence the spec is bug compatible :-)
> > > > > > > > >  
> > > > > > > > > >
> > > > > > > > > > If what we're trying to do is expose that PASID and PRI are  
> > enabled  
> > > > on  
> > > > > > > > > > the PF to a VF driver, maybe duplicating the PF capabilities on  
> > the  
> > > > VF  
> > > > > > > > > > without the ability to control it is not the right approach.  
> > Maybe  
> > > > we  
> > > > > > > > >
> > > > > > > > > As long as the capability enable is only provided when the PF has  
> > > > > > enabled  
> > > > > > > > > the feature. Then it seems the hardware seems to do the right  
> > thing.  
> > > > > > > > >
> > > > > > > > > Assume we expose PASID/PRI only when PF has enabled it. It will  
> > be  
> > > > the  
> > > > > > > > > case since the PF driver needs to exist, and IOMMU would have  
> > set  
> > > > the  
> > > > > > > > > PASID/PRI/ATS on PF.
> > > > > > > > >
> > > > > > > > > If the emulation is purely spoofing the capability. Once vIOMMU  
> > > > driver  
> > > > > > > > > enables PASID, the context entries for the VF are completely  
> > > > > > independent  
> > > > > > > > > from the PF context entries.
> > > > > > > > >
> > > > > > > > > vIOMMU would enable PASID, and we just spoof the PASID  
> > > > capability.  
> > > > > > > > >
> > > > > > > > > If vIOMMU or guest for some reason does disable_pasid(), then  
> > the  
> > > > > > > > > vIOMMU driver can disaable PASID on the VF context entries. So  
> > the  
> > > > VF  
> > > > > > > > > although the capability is blanket enabled on PF, IOMMU  
> > gaurantees  
> > > > > > the  
> > > > > > > > > transactions are blocked.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > In the interim, it seems like the intent of the virtual capability
> > > > > > > > > can be honored via help from the IOMMU for the controlling  
> > aspect..  
> > > > > > > > >
> > > > > > > > > Did i miss anything?  
> > > > > > > >
> > > > > > > > Above works for emulating the enable bit (under the assumption  
> > that  
> > > > > > > > PF driver won't disable pasid when vf is assigned). However, there  
> > are  
> > > > > > > > also "Execute permission enable" and "Privileged mode enable"  
> > bits in  
> > > > > > > > PASID control registers. I don't know how those bits could be  
> > cleanly  
> > > > > > > > emulated when the guest writes a value different from PF's...  
> > > > > > >
> > > > > > > sent too quick. the IOMMU also includes control bits for allowing/
> > > > > > > blocking execute requests and supervisor requests. We can rely on
> > > > > > > IOMMU to block those requests to emulate the disabled cases of
> > > > > > > all three control bits in the pasid cap.  
> > > > > >
> > > > > >
> > > > > > So if the emulation of the PASID capability takes into account the
> > > > > > IOMMU configuration to back that emulation, shouldn't we do that
> > > > > > emulation in the hypervisor, ie. QEMU, rather than the kernel vfio
> > > > > > layer?  Thanks,
> > > > > >
> > > > > > Alex  
> > > > >
> > > > > We need enforce it in physical IOMMU, to ensure that even the
> > > > > VF may send requests which violate the guest expectation those
> > > > > requests are always blocked by IOMMU. Kernel vfio identifies
> > > > > such need when emulating the pasid cap and then forward the
> > > > > request to host iommu driver.  
> > > >
> > > > Implementing this in the kernel would be necessary if we needed to
> > > > protect from the guest device doing something bad to the host or
> > > > other devices.  Making sure the physical IOMMU is configured to meet
> > > > guest expectations doesn't sound like it necessarily falls into that
> > > > category.  We do that on a regular basis to program the DMA mappings.
> > > > Tell me more about why the hypervisor can't handle this piece of
> > > > guest/host synchronization on top of all the other things it
> > > > synchronizes to make a VM.  Thanks,
> > > >  
> > >
> > > I care more about "execution permission" and "privileged mode".
> > > It might be dangerous when the guest disallows the VF from sending  
> > 
> > "Dangerous" how?  We're generally ok with the user managing their own
> > consistency, it's when the user can affect other users/devices that we
> > require vfio in the kernel to actively manage something.  There's a very
> > different scope to the vfio-pci kernel module implementing a fake
> > capability and trying to make it behave indistinguishably from the real
> > capability versus a userspace driver piecing together an emulation
> > that's good enough for their purposes.  Thanks,
> >  
> 
> How could emulation fix this gap when the VF DMAs don't go through
> the vIOMMU? What you explained all makes sense before talking about
> the emulation of PASID capability, i.e. vfio only cares about isolation 
> between assigned devices. However now vfio exposes a capability 
> which is shared by PF/VF while pure software emulation may break 
> the guest expectation, and now the only viable mitigation is to get 
> the help from physical IOMMU. then why cannot vfio include such 
> mitigation in its emulation of the PASID capability? 

DMA never actually goes "through" the vIOMMU.  I'm not suggesting that
vfio doesn't participate some how, but I don't know that emulating a
capability that doesn't exist and involves policy should be done in the
kernel, versus providing userspace with an interface to control what
they need to implement that emulation.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
